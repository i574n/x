param(
    [Parameter(Mandatory)] [string] $Exe,
    [Parameter(Mandatory)] [string] $WorkDir,
    [string] $Tutorial = (Join-Path $PSScriptRoot "../README.md"),
    [switch] $Accept
)
$ErrorActionPreference = "Stop"

$world = Get-Content -Raw (Join-Path $PSScriptRoot "world.json") | ConvertFrom-Json
$exePath = (Resolve-Path $Exe).Path
New-Item -ItemType Directory -Force $WorkDir | Out-Null
$portFile = Join-Path $WorkDir "port.txt"
$requestLog = Join-Path $WorkDir "requests.jsonl"
Remove-Item $portFile, $requestLog -ErrorAction Ignore
New-Item -ItemType File $requestLog | Out-Null

function Read-Requests { @(Get-Content $requestLog | Where-Object { $_ } | ForEach-Object { $_ | ConvertFrom-Json }) }

function Invoke-Step([string] $Script, [string] $Token, [string] $UserToken = $world.user_token, [hashtable] $Extra = @{}) {
    $info = [System.Diagnostics.ProcessStartInfo]::new("pwsh")
    foreach ($a in "-NoProfile", "-NonInteractive", "-OutputFormat", "Text", "-EncodedCommand") { $info.ArgumentList.Add($a) }
    $utf8 = "[Console]::OutputEncoding = [Text.UTF8Encoding]::new(`$false); `$OutputEncoding = [Console]::OutputEncoding"
    $body = "`$ProgressPreference = 'SilentlyContinue'`n$utf8`nSet-Alias xc '$exePath'`n$Script`nexit `$LASTEXITCODE"
    $info.ArgumentList.Add([Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($body)))
    $info.RedirectStandardOutput = $true
    $info.RedirectStandardError = $true
    $info.StandardOutputEncoding = [Text.UTF8Encoding]::new($false)
    $info.StandardErrorEncoding = [Text.UTF8Encoding]::new($false)
    $info.UseShellExecute = $false
    $info.WorkingDirectory = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
    $info.Environment["X_BEARER_TOKEN"] = $Token
    $info.Environment["X_OAUTH2_ACCESS_TOKEN"] = $UserToken
    $info.Environment["TZ"] = "America/Cuiaba"
    $info.Environment["X_API_BASE_URL"] = "http://127.0.0.1:$port"
    foreach ($k in $Extra.Keys) { $info.Environment[$k] = $Extra[$k] }
    $before = (Read-Requests).Count
    $process = [System.Diagnostics.Process]::Start($info)
    $out = $process.StandardOutput.ReadToEndAsync()
    $err = $process.StandardError.ReadToEndAsync()
    if (!$process.WaitForExit(60000)) { $process.Kill($true); throw "step timed out after 60 s: $Script" }
    $lines = @($err.Result, $out.Result) | ForEach-Object { $_ -split "\r?\n" } | Where-Object { $_ -ne "" }
    [pscustomobject]@{
        Text = ($lines -join "`n")
        Stdout = $out.Result.Replace("`r`n", "`n")
        Stderr = $err.Result
        Exit = $process.ExitCode
        Requests = @(Read-Requests | Select-Object -Skip $before)
    }
}

$failures = [System.Collections.Generic.List[string]]::new()
function Check([bool] $Condition, [string] $Message) { if (!$Condition) { $failures.Add($Message) } }
function Step-Of([hashtable] $Results, [string] $Pattern) { $Results[@($Results.Keys | Where-Object { $_ -match $Pattern })[0]] }
function Queries-Of($Step) { @($Step.Requests | ForEach-Object { "$($_.method) $($_.path)?$($_.query)" }) }

$python = (Get-Command python, python3 -CommandType Application -ErrorAction Ignore | Select-Object -First 1).Source
$stub = Start-Process $python -ArgumentList "-I", (Join-Path $PSScriptRoot "stub.py"), (Join-Path $PSScriptRoot "world.json"), $portFile, $requestLog -PassThru -NoNewWindow
try {
    $deadline = (Get-Date).AddSeconds(60)
    while (!(Test-Path $portFile) -or !(Get-Content $portFile -ErrorAction Ignore)) {
        if ($stub.HasExited) { throw "the X API stub exited before writing its port (exit code $($stub.ExitCode))" }
        if ((Get-Date) -gt $deadline) { throw "the X API stub did not write its port within 60 s" }
        Start-Sleep -Milliseconds 100
    }
    $port = [int](Get-Content $portFile)

    $tutorialText = [IO.File]::ReadAllText((Resolve-Path $Tutorial).Path).Replace("`r`n", "`n")
    $steps = [regex]::Matches($tutorialText, '(?s)```powershell\n((?:(?!```).)*?)\n```\n\n```text\n((?:(?!```).)*?)\n```')
    Check ($steps.Count -ge 21) "expected at least 21 checked steps in the tutorial, found $($steps.Count)"
    $outputs = [System.Collections.Generic.List[string]]::new()
    $accepted = [System.Collections.Generic.List[object]]::new()
    $results = @{}
    foreach ($step in $steps) {
        $script = $step.Groups[1].Value
        $expected = $step.Groups[2].Value
        $r = Invoke-Step $script $world.token
        $results[$script] = $r
        $outputs.Add($r.Text)
        $accepted.Add([pscustomobject]@{ Index = $step.Groups[2].Index; Length = $step.Groups[2].Length; Text = $r.Text })
        Check ($Accept -or $r.Text -ceq $expected) "tutorial step '$script'`n--- expected`n$expected`n--- actual`n$($r.Text)"
        if ($script -notmatch 'LASTEXITCODE') { Check ($r.Exit -eq 0) "tutorial step '$script' exited $($r.Exit)" }
        Write-Output "x e2e / tutorial / $script / $(if ($r.Text -ceq $expected) { 'same' } else { 'DIFFERENT' }) / $($r.Requests.Count) request(s)"
    }

    $postsPath = "/2/users/{0}/tweets?max_results=5&post.fields=created_at,author_id,public_metrics,entities,attachments"
    $nothingRead = "xc: 2 API requests, 0 posts read, 0 shown"
    $extra = @(
        @{ Script = "xc timeline alice"; Token = "wrong-token"; Text = "xc: X API answered 401 for /2/users/by?usernames=alice: Unauthorized"; Exit = 4 },
        @{ Script = "xc timeline busy"; Token = $world.token; Text = "$nothingRead`nxc: X API answered 429 for $($postsPath -f 107): Too Many Requests"; Exit = 4 },
        @{ Script = "xc timeline gateway"; Token = $world.token; Text = "$nothingRead`nxc: X API answered 502 for $($postsPath -f 108): Bad Gateway"; Exit = 4 },
        @{ Script = "xc timeline nobody"; Token = $world.token; Text = "xc: no X account @nobody"; Exit = 4 },
        @{ Script = "xc delete 9001"; Token = $world.token; Text = "xc: X API answered 404 for /2/tweets/9001: Not Found Error: Could not find post with id: [9001]."; Exit = 4 }
    )
    foreach ($case in $extra) {
        $r = Invoke-Step $case.Script $case.Token
        $outputs.Add($r.Text)
        Check ($r.Text -ceq $case.Text -and $r.Exit -eq $case.Exit) "extra '$($case.Script)' (token $($case.Token)): expected exit $($case.Exit) '$($case.Text)', got exit $($r.Exit) '$($r.Text)'"
        Write-Output "x e2e / extra / $($case.Script) / exit $($r.Exit)"
    }

    foreach ($sim in @(@{ Name = 'sim-small'; Exit = 0 }, @{ Name = 'sim-stress'; Exit = 0 }, @{ Name = 'sim-lost'; Exit = 4 }, @{ Name = 'sim-gap'; Exit = 4 })) {
        $expected = Get-Content -Raw (Join-Path $PSScriptRoot "$($sim.Name).expected.json") | ConvertFrom-Json
        $r = Invoke-Step "xc thread $($expected.root)" $world.token
        $outputs.Add($r.Text)
        $lines = @($expected.program)
        $want = if ($lines.Count) { ($lines -join "`n") + "`n" } else { "" }
        Check ($r.Stdout -ceq $want) "xc thread $($expected.root) did not rebuild the $($sim.Name) program the sim posted ($($r.Stdout.Length) vs $($want.Length) chars)"
        Check ($r.Exit -eq $sim.Exit) "xc thread $($expected.root) exited $($r.Exit), expected $($sim.Exit)"
        foreach ($cell in @($expected.incomplete)) { Check ($r.Stderr -match "cell $cell is missing frame") "xc thread $($expected.root) did not name the incomplete cell $cell" }
        foreach ($cell in @($expected.gaps)) { Check ($r.Stderr -match "cell $cell replies to \d+, which is not in the thread") "xc thread $($expected.root) did not name the gap before cell $cell" }
        Write-Output "x e2e / sim / $($sim.Name) / thread $($expected.root) / $($r.Requests.Count) request(s) / exit $($r.Exit)"
    }

    $oracle = Get-Content -Raw (Join-Path $PSScriptRoot 'thread-oauth1.expected.json') | ConvertFrom-Json
    $wrote = Invoke-Step "xc post-thread oauth1.spi" $world.token
    $outputs.Add($wrote.Text)
    $sent = @($wrote.Requests | Where-Object { $_.method -eq 'POST' } | ForEach-Object { $_.body | ConvertFrom-Json })
    $ids = @($wrote.Stdout -split "`n" | Where-Object { $_ -match '^posted (\d+) ' } | ForEach-Object { ($_ -split ' ')[1] })
    Check ($wrote.Exit -eq 0 -and $sent.Count -eq @($oracle.posts).Count) "xc post-thread sent $($sent.Count) posts, the sim splits oauth1.spi into $(@($oracle.posts).Count) (exit $($wrote.Exit))"
    for ($i = 0; $i -lt [Math]::Min($sent.Count, @($oracle.posts).Count); $i++) {
        Check ($sent[$i].text -ceq @($oracle.posts)[$i]) "post $($i + 1) differs from the sim's split:`n--- sim`n$(@($oracle.posts)[$i])`n--- xc`n$($sent[$i].text)"
        $parent = if ($i -eq 0) { $null } else { $ids[$i - 1] }
        Check ($sent[$i].reply.in_reply_to_tweet_id -eq $parent) "post $($i + 1) replies to '$($sent[$i].reply.in_reply_to_tweet_id)', expected '$parent'"
    }
    $back = Invoke-Step "xc thread $($ids[0])" $world.token
    $want = (@($oracle.program) -join "`n") + "`n"
    Check ($back.Exit -eq 0 -and $back.Stdout -ceq $want) "xc thread $($ids[0]) did not read back the posted oauth1.spi ($($back.Stdout.Length) vs $($want.Length) chars)`n$($back.Stdout)"
    Write-Output "x e2e / post-thread / $($sent.Count) posts / read back $($back.Stdout.Length) chars / exit $($back.Exit)"
    $gone = Invoke-Step "xc delete-thread $($ids[0])" $world.token
    $deletes = @($gone.Requests | Where-Object { $_.method -eq 'DELETE' })
    Check ($gone.Exit -eq 0 -and $deletes.Count -eq $sent.Count) "xc delete-thread deleted $($deletes.Count) of $($sent.Count) posts (exit $($gone.Exit))"
    Check ((Invoke-Step "xc thread $($ids[0])" $world.token).Exit -eq 4) "the thread still reads after xc delete-thread"
    Write-Output "x e2e / delete-thread / $($deletes.Count) deleted / exit $($gone.Exit)"

    $mastodonPort, $mastodonLog = (Join-Path $WorkDir "mastodon.port"), (Join-Path $WorkDir "mastodon.jsonl")
    Remove-Item $mastodonPort, $mastodonLog -ErrorAction Ignore
    $social = Start-Process $python -ArgumentList "-I", (Join-Path $PSScriptRoot "social_stub.py"), "mastodon", $mastodonPort, $mastodonLog -PassThru -NoNewWindow
    try {
        $deadline = (Get-Date).AddSeconds(60)
        while (!(Test-Path $mastodonPort) -or !(Get-Content $mastodonPort -ErrorAction Ignore)) {
            if ($social.HasExited -or (Get-Date) -gt $deadline) { throw "the Mastodon stub did not write its port" }
            Start-Sleep -Milliseconds 100
        }
        $mastodon = "http://127.0.0.1:$((Get-Content $mastodonPort -Raw).Trim())"
        $site = @{ XC_SITE = "mastodon"; MASTODON_BASE_URL = $mastodon; MASTODON_ACCESS_TOKEN = "mastodon-e2e-token" }
        $tooted = Invoke-Step "xc post-thread oauth1.spi" $world.token -Extra $site
        $outputs.Add($tooted.Text)
        $statuses = @(Get-Content $mastodonLog | ForEach-Object { $_ | ConvertFrom-Json } | Where-Object { $_.path -eq "/api/v1/statuses" })
        $bodies = @($statuses | ForEach-Object { $_.body | ConvertFrom-Json })
        $accepted200 = @($statuses | Where-Object status -eq 200).Count
        Check ($tooted.Exit -eq 0 -and $statuses.Count -gt 0 -and $accepted200 -eq $statuses.Count) "xc post-thread to Mastodon: exit $($tooted.Exit), $accepted200 of $($statuses.Count) statuses accepted"
        Check ($statuses.Count -le $sent.Count) "Mastodon's 500 split used $($statuses.Count) posts, more than X's 280 split ($($sent.Count))"
        Check (@($bodies | Where-Object { $_.status.Contains([string][char]0x200B) }).Count -eq 0) "a Mastodon status carries a zero-width space"
        Check ($tooted.Requests.Count -eq 0) "xc post-thread to Mastodon also sent $($tooted.Requests.Count) request(s) to the X stub"
        $tootIds = @($tooted.Stdout -split "`n" | Where-Object { $_ -match '^posted (\d+) ' } | ForEach-Object { ($_ -split ' ')[1] })
        for ($i = 1; $i -lt $bodies.Count; $i++) {
            Check ($bodies[$i].in_reply_to_id -eq $tootIds[$i - 1]) "status $($i + 1) replies to '$($bodies[$i].in_reply_to_id)', expected '$($tootIds[$i - 1])'"
        }
        Write-Output "x e2e / mastodon post-thread / $($statuses.Count) statuses / exit $($tooted.Exit)"
    } finally {
        if (!$social.HasExited) { Stop-Process -Id $social.Id -Force }
    }

    $blueskyPort, $blueskyLog = (Join-Path $WorkDir "bluesky.port"), (Join-Path $WorkDir "bluesky.jsonl")
    Remove-Item $blueskyPort, $blueskyLog -ErrorAction Ignore
    $sky = Start-Process $python -ArgumentList "-I", (Join-Path $PSScriptRoot "social_stub.py"), "bluesky", $blueskyPort, $blueskyLog -PassThru -NoNewWindow
    try {
        $deadline = (Get-Date).AddSeconds(60)
        while (!(Test-Path $blueskyPort) -or !(Get-Content $blueskyPort -ErrorAction Ignore)) {
            if ($sky.HasExited -or (Get-Date) -gt $deadline) { throw "the Bluesky stub did not write its port" }
            Start-Sleep -Milliseconds 100
        }
        $pds = "http://127.0.0.1:$((Get-Content $blueskyPort -Raw).Trim())"
        $site = @{ XC_SITE = "bluesky"; BLUESKY_BASE_URL = $pds; BLUESKY_IDENTIFIER = "e2e.bsky.social"; BLUESKY_APP_PASSWORD = "e2e-app-password" }
        $skeeted = Invoke-Step "xc post-thread oauth1.spi" $world.token -Extra $site
        $outputs.Add($skeeted.Text)
        $rows = @(Get-Content $blueskyLog | ForEach-Object { $_ | ConvertFrom-Json })
        $sessions = @($rows | Where-Object { $_.path -eq "/xrpc/com.atproto.server.createSession" })
        $records = @($rows | Where-Object { $_.path -eq "/xrpc/com.atproto.repo.createRecord" })
        $bodies = @($records | ForEach-Object { ($_.body | ConvertFrom-Json).record })
        $ok = @($records | Where-Object status -eq 200).Count
        Check ($skeeted.Exit -eq 0 -and $sessions.Count -eq 1 -and $records.Count -gt 0 -and $ok -eq $records.Count) "xc post-thread to Bluesky: exit $($skeeted.Exit), $($sessions.Count) session(s), $ok of $($records.Count) records accepted"
        Check ($records.Count -le $sent.Count) "Bluesky's 300 split used $($records.Count) posts, more than X's 280 split ($($sent.Count))"
        Check (@($bodies | Where-Object { $_.text.Contains([string][char]0x200B) }).Count -eq 0) "a Bluesky record carries a zero-width space"
        Check ($skeeted.Requests.Count -eq 0) "xc post-thread to Bluesky also sent $($skeeted.Requests.Count) request(s) to the X stub"
        $uris = @($skeeted.Stdout -split "`n" | Where-Object { $_ -match '^posted (\S+) ' } | ForEach-Object { ($_ -split ' ')[1] })
        for ($i = 1; $i -lt $bodies.Count; $i++) {
            Check ($bodies[$i].reply.parent.uri -eq $uris[$i - 1] -and $bodies[$i].reply.root.uri -eq $uris[0]) "record $($i + 1) does not reply to its parent and the thread root"
        }
        Write-Output "x e2e / bluesky post-thread / $($records.Count) records / exit $($skeeted.Exit)"
        $refused = @{ XC_SITE = "bluesky"; BLUESKY_BASE_URL = $pds; BLUESKY_IDENTIFIER = "e2e.bsky.social"; BLUESKY_APP_PASSWORD = "not-the-app-password" }
        $denied = Invoke-Step "xc post-thread oauth1.spi" $world.token -Extra $refused
        $outputs.Add($denied.Text)
        $created = @(Get-Content $blueskyLog | ForEach-Object { $_ | ConvertFrom-Json } | Where-Object { $_.path -eq "/xrpc/com.atproto.repo.createRecord" }).Count
        Check ($denied.Exit -eq 4 -and $created -eq $records.Count) "a refused Bluesky sign-in: exit $($denied.Exit), $($created - $records.Count) record(s) created"
        Check ($denied.Text.Contains("Invalid identifier or password") -and !$denied.Text.Contains("not-the-app-password")) "a refused Bluesky sign-in does not say why, or echoes the password"
        Write-Output "x e2e / bluesky refused sign-in / exit $($denied.Exit)"
        $single = Invoke-Step "xc post 'one post to the sky'" $world.token -Extra $site
        $outputs.Add($single.Text)
        $uri = @($single.Stdout -split "`n" | Where-Object { $_ -match '^posted (\S+)' } | ForEach-Object { ($_ -split ' ')[1] }) | Select-Object -First 1
        $gone = Invoke-Step "xc delete '$uri'" $world.token -Extra $site
        $outputs.Add($gone.Text)
        $removals = @(Get-Content $blueskyLog | ForEach-Object { $_ | ConvertFrom-Json } | Where-Object { $_.path -eq "/xrpc/com.atproto.repo.deleteRecord" -and $_.status -eq 200 }).Count
        Check ($single.Exit -eq 0 -and $uri -and $gone.Exit -eq 0 -and $removals -eq 1) "a single Bluesky post and its delete: exits $($single.Exit)/$($gone.Exit), uri '$uri', $removals deleteRecord(s)"
        Check ($single.Requests.Count + $gone.Requests.Count -eq 0) "a single Bluesky post or delete also talked to the X stub"
        Write-Output "x e2e / bluesky post and delete / exits $($single.Exit)/$($gone.Exit)"
        $mixed = Invoke-Step "xc delete-thread 9003" $world.token -Extra $site
        $outputs.Add($mixed.Text)
        Check ($mixed.Exit -eq 2 -and $mixed.Requests.Count -eq 0 -and $mixed.Text.Contains("needs XC_SITE=x")) "xc delete-thread under XC_SITE=bluesky: exit $($mixed.Exit), $($mixed.Requests.Count) X request(s); it must refuse before reading X"
        Write-Output "x e2e / bluesky delete-thread refused / exit $($mixed.Exit)"
    } finally {
        if (!$sky.HasExited) { Stop-Process -Id $sky.Id -Force }
    }

    Check ((Step-Of $results 'X_BEARER_TOKEN = \$null').Requests.Count -eq 0) "a run without X_BEARER_TOKEN sent requests"
    $all = Queries-Of (Step-Of $results 'following carol --max-following all')
    $boundedPages = "GET /2/users/103/following?max_results=201", "GET /2/users/103/following?max_results=199&pagination_token=p2"
    Check ((@($all | Where-Object { $_ -like '*/following?*' }) -join ' ') -ceq ($boundedPages -join ' ')) "--max-following all did not read the 201-account bound across next_token: $($all -join ' ')"
    $capped = @((Step-Of $results 'max-following 2').Requests | Where-Object { $_.path -like '*/following' })
    Check ($capped.Count -eq 1 -and $capped[0].query -eq "max_results=2") "--max-following 2 read more than one page of 2"
    Check (@(Queries-Of (Step-Of $results '--start-time') | Where-Object { $_ -match 'start_time=2026-10-15T12:00:00Z&end_time=2026-10-15T13:06:00Z' }).Count -eq 1) "--start-time/--end-time did not become start_time/end_time"
    Check (@(Queries-Of (Step-Of $results '--originals') | Where-Object { $_ -match 'exclude=replies,retweets' }).Count -eq 2) "--originals did not exclude replies and reposts at the API"
    $deep = Queries-Of (Step-Of $results '--depth 3')
    Check (($deep -match '^GET /2/tweets\?ids=').Count -eq 2 -and ($deep -match '^GET /2/users\?ids=').Count -eq 1) "--depth 3 did not look up two levels and name authors once: $($deep -join ' ')"
    $posted = @((Step-Of $results 'xc post "hello from xc"').Requests)
    Check ($posted.Count -eq 1 -and $posted[0].method -eq 'POST' -and $posted[0].body -eq '{"text":"hello from xc"}' -and $posted[0].context -eq 'user') "xc post did not send one user-context POST with the text as JSON"
    $deleted = @((Step-Of $results '^xc delete 9001$').Requests)
    Check ($deleted.Count -eq 1 -and $deleted[0].method -eq 'DELETE' -and $deleted[0].context -eq 'user') "xc delete did not send one user-context DELETE"
    $signed = @((Step-Of $results 'signed: 100%').Requests)
    Check ($signed.Count -eq 2 -and @($signed | Where-Object { $_.context -eq 'oauth1' }).Count -eq 2 -and $signed[0].body -eq '{"text":"signed: 100% & done"}') "OAuth 1.0a post and delete were not both accepted as signed requests"
    $unauthorized = @(Read-Requests | Where-Object { !$_.authorized }).Count
    Check ($unauthorized -eq 2) "expected exactly two unauthorized requests (the wrong bearer token and the forged signature), got $unauthorized"
    $leaks = @($outputs | Where-Object { $_.Contains($world.token) -or $_.Contains($world.user_token) -or $_.Contains($world.oauth1.token_secret) -or $_.Contains($world.oauth1.consumer_secret) -or $_.Contains($world.oauth2.client_secret) -or $_.Contains($world.oauth2.refresh_token) -or $_.Contains($world.oauth2.access_token) })
    Check ($leaks.Count -eq 0) "a token appeared in program output"
    Write-Output "x e2e / $((Read-Requests).Count) requests to the stub on port $port"
} finally {
    if (!$stub.HasExited) { Stop-Process -Id $stub.Id -Force }
}

if ($Accept) {
    $doc = $tutorialText
    foreach ($b in ($accepted | Sort-Object Index -Descending)) { $doc = $doc.Substring(0, $b.Index) + $b.Text + $doc.Substring($b.Index + $b.Length) }
    if ($doc -cne $tutorialText) { [IO.File]::WriteAllText((Resolve-Path $Tutorial).Path, $doc) }
    Write-Output "x e2e / accepted $(@($accepted | Where-Object { $tutorialText.Substring($_.Index, $_.Length) -cne $_.Text }).Count) of $($accepted.Count) tutorial outputs in $Tutorial"
}

if ($failures.Count) {
    $failures | ForEach-Object { Write-Output "x e2e / FAILED / $_" }
    throw "RUST-FAILED x/apps/client / e2e: $($failures.Count) failure(s)"
}
Write-Output "RUST-OK x/apps/client / e2e: $($steps.Count) tutorial steps and $($extra.Count) extra cases"
