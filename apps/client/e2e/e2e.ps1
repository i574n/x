param(
    [Parameter(Mandatory)] [string] $Exe,
    [Parameter(Mandatory)] [string] $WorkDir,
    [string] $Tutorial = (Join-Path $PSScriptRoot "../README.md")
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

function Invoke-Step([string] $Script, [string] $Token, [string] $UserToken = $world.user_token) {
    $info = [System.Diagnostics.ProcessStartInfo]::new("pwsh")
    foreach ($a in "-NoProfile", "-NonInteractive", "-EncodedCommand") { $info.ArgumentList.Add($a) }
    $body = "Set-Alias xc '$exePath'`n$Script`nexit `$LASTEXITCODE"
    $info.ArgumentList.Add([Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($body)))
    $info.RedirectStandardOutput = $true
    $info.RedirectStandardError = $true
    $info.UseShellExecute = $false
    $info.Environment["X_BEARER_TOKEN"] = $Token
    $info.Environment["X_OAUTH2_ACCESS_TOKEN"] = $UserToken
    $info.Environment["TZ"] = "America/Cuiaba"
    $info.Environment["X_API_BASE_URL"] = "http://127.0.0.1:$port"
    $before = (Read-Requests).Count
    $process = [System.Diagnostics.Process]::Start($info)
    $out = $process.StandardOutput.ReadToEndAsync()
    $err = $process.StandardError.ReadToEndAsync()
    if (!$process.WaitForExit(60000)) { $process.Kill($true); throw "step timed out after 60 s: $Script" }
    $lines = @($err.Result, $out.Result) | ForEach-Object { $_ -split "\r?\n" } | Where-Object { $_ -ne "" }
    [pscustomobject]@{
        Text = ($lines -join "`n")
        Raw = $out.Result.Replace("`r`n", "`n")
        Errors = $err.Result
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
    $deadline = (Get-Date).AddSeconds(15)
    while (!(Test-Path $portFile) -or !(Get-Content $portFile -ErrorAction Ignore)) {
        if ((Get-Date) -gt $deadline -or $stub.HasExited) { throw "the X API stub did not start" }
        Start-Sleep -Milliseconds 100
    }
    $port = [int](Get-Content $portFile)

    $tutorialText = [IO.File]::ReadAllText((Resolve-Path $Tutorial).Path).Replace("`r`n", "`n")
    $steps = [regex]::Matches($tutorialText, '(?s)```powershell\n((?:(?!```).)*?)\n```\n\n```text\n((?:(?!```).)*?)\n```')
    Check ($steps.Count -ge 21) "expected at least 21 checked steps in the tutorial, found $($steps.Count)"
    $outputs = [System.Collections.Generic.List[string]]::new()
    $results = @{}
    foreach ($step in $steps) {
        $script = $step.Groups[1].Value
        $expected = $step.Groups[2].Value
        $r = Invoke-Step $script $world.token
        $results[$script] = $r
        $outputs.Add($r.Text)
        Check ($r.Text -ceq $expected) "tutorial step '$script'`n--- expected`n$expected`n--- actual`n$($r.Text)"
        if ($script -notmatch 'LASTEXITCODE') { Check ($r.Exit -eq 0) "tutorial step '$script' exited $($r.Exit)" }
        Write-Output "x e2e / tutorial / $script / $(if ($r.Text -ceq $expected) { 'same' } else { 'DIFFERENT' }) / $($r.Requests.Count) request(s)"
    }

    $postsPath = "/2/users/{0}/tweets?max_results=5&post.fields=created_at,author_id,public_metrics,entities,attachments"
    $extra = @(
        @{ Script = "xc timeline alice"; Token = "wrong-token"; Text = "xc: X API answered 401 for /2/users/by?usernames=alice: Unauthorized"; Exit = 4 },
        @{ Script = "xc timeline busy"; Token = $world.token; Text = "xc: X API answered 429 for $($postsPath -f 107): Too Many Requests"; Exit = 4 },
        @{ Script = "xc timeline gateway"; Token = $world.token; Text = "xc: X API answered 502 for $($postsPath -f 108): Bad Gateway"; Exit = 4 },
        @{ Script = "xc timeline nobody"; Token = $world.token; Text = "xc: no X account @nobody"; Exit = 4 },
        @{ Script = "xc delete 9001"; Token = $world.token; Text = "xc: X API answered 404 for /2/tweets/9001: Not Found Error: Could not find post with id: [9001]."; Exit = 4 }
    )
    foreach ($case in $extra) {
        $r = Invoke-Step $case.Script $case.Token
        $outputs.Add($r.Text)
        Check ($r.Text -ceq $case.Text -and $r.Exit -eq $case.Exit) "extra '$($case.Script)' (token $($case.Token)): expected exit $($case.Exit) '$($case.Text)', got exit $($r.Exit) '$($r.Text)'"
        Write-Output "x e2e / extra / $($case.Script) / exit $($r.Exit)"
    }

    foreach ($sim in @(@{ Name = 'sim-small'; Exit = 0 }, @{ Name = 'sim-stress'; Exit = 0 }, @{ Name = 'sim-lost'; Exit = 4 })) {
        $expected = Get-Content -Raw (Join-Path $PSScriptRoot "$($sim.Name).expected.json") | ConvertFrom-Json
        $r = Invoke-Step "xc thread $($expected.root)" $world.token
        $outputs.Add($r.Text)
        $lines = @($expected.program)
        $want = if ($lines.Count) { ($lines -join "`n") + "`n" } else { "" }
        Check ($r.Raw -ceq $want) "xc thread $($expected.root) did not rebuild the $($sim.Name) program the sim posted ($($r.Raw.Length) vs $($want.Length) chars)"
        Check ($r.Exit -eq $sim.Exit) "xc thread $($expected.root) exited $($r.Exit), expected $($sim.Exit)"
        foreach ($cell in @($expected.incomplete)) { Check ($r.Errors -match "cell $cell is missing frame") "xc thread $($expected.root) did not name the incomplete cell $cell" }
        Write-Output "x e2e / sim / $($sim.Name) / thread $($expected.root) / $($r.Requests.Count) request(s) / exit $($r.Exit)"
    }

    Check ((Step-Of $results 'X_BEARER_TOKEN = \$null').Requests.Count -eq 0) "a run without X_BEARER_TOKEN sent requests"
    $all = Queries-Of (Step-Of $results 'following carol --max-following all')
    Check ($all -contains "GET /2/users/103/following?max_results=1000&pagination_token=p2") "--max-following all did not follow next_token: $($all -join ' ')"
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

if ($failures.Count) {
    $failures | ForEach-Object { Write-Output "x e2e / FAILED / $_" }
    throw "RUST-FAILED x/apps/client / e2e: $($failures.Count) failure(s)"
}
Write-Output "RUST-OK x/apps/client / e2e: $($steps.Count) tutorial steps and $($extra.Count) extra cases"
