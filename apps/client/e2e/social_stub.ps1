param([string] $Site, [string] $PortPath, [string] $LogPath, [switch] $SelfTest)
$ErrorActionPreference = "Stop"

$sites = @{
    mastodon = @{ Limit = 500; LinkWeight = 23; ByteLimit = $null; Token = "mastodon-e2e-token" }
    bluesky = @{ Limit = 300; LinkWeight = $null; ByteLimit = 3000; Token = "bluesky-e2e-token" }
}
$url = [regex]::new('https?://(?:[a-z0-9-]+\.)+[a-z0-9-]+(?:/[^\s]*)?', 'IgnoreCase')
$posts = [ordered]@{}
$script:nextId = [long]110000000000000001
$epoch = [datetime]::new(2026, 10, 1, 0, 0, 0, [DateTimeKind]::Utc)

function Get-Graphemes([string] $Text) { [Globalization.StringInfo]::new($Text.Normalize()).LengthInTextElements }

function Get-CountedLength([string] $Name, [string] $Text) {
    $rule = $sites[$Name]
    if ($null -eq $rule.LinkWeight) { return Get-Graphemes $Text }
    $total, $at = 0, 0
    foreach ($m in $url.Matches($Text)) {
        $total += (Get-Graphemes ($Text.Substring($at, $m.Index - $at))) + $rule.LinkWeight
        $at = $m.Index + $m.Length
    }
    $total + (Get-Graphemes ($Text.Substring($at)))
}

function Test-TooLong([string] $Name, [string] $Text) {
    $rule = $sites[$Name]
    (Get-CountedLength $Name $Text) -gt $rule.Limit -or ($null -ne $rule.ByteLimit -and [Text.Encoding]::UTF8.GetByteCount($Text) -gt $rule.ByteLimit)
}

function Add-Post([string] $Text, $Parent) {
    $id = [string]$script:nextId
    $script:nextId++
    $stamp = $epoch.AddSeconds($posts.Count).ToString("yyyy-MM-dd'T'HH:mm:ss'.000Z'", [cultureinfo]::InvariantCulture)
    $posts[$id] = [ordered]@{ id = $id; text = $Text; parent = $Parent; created_at = $stamp }
    $posts[$id]
}

function Remove-Post([string] $Id) {
    if (!$posts.Contains($Id)) { return $null }
    $post = $posts[$Id]
    $posts.Remove($Id)
    $post
}

function Get-Children([string] $Id) { $posts.Values | Where-Object { $_.parent -ceq $Id } }

function Get-Descendants([string] $Id) {
    $frontier = [Collections.Generic.Queue[string]]::new()
    $frontier.Enqueue($Id)
    while ($frontier.Count) {
        foreach ($child in Get-Children ($frontier.Dequeue())) { $child; $frontier.Enqueue($child.id) }
    }
}

function Get-Ancestors([string] $Id) {
    $chain = [Collections.Generic.List[object]]::new()
    $current = $posts[$Id].parent
    while ($current -and $posts.Contains($current)) { $chain.Insert(0, $posts[$current]); $current = $posts[$current].parent }
    $chain
}

function ConvertTo-Status($Post) { [ordered]@{ id = $Post.id; content = $Post.text; in_reply_to_id = $Post.parent; created_at = $Post.created_at; visibility = "public" } }

function Invoke-Mastodon([string] $Method, [string] $Path, $Body, [bool] $TokenOk) {
    if (!$TokenOk) { return 401, @{ error = "The access token is invalid" } }
    $parts = $Path.Trim("/").Split("/")
    if ($Method -eq "POST" -and $Path -eq "/api/v1/statuses") {
        $text = ([string]$Body["status"]).TrimEnd()
        $parent = if ($Body["in_reply_to_id"]) { [string]$Body["in_reply_to_id"] } else { $null }
        if (!$text) { return 422, @{ error = "Validation failed: Text can't be blank" } }
        if (Test-TooLong mastodon $text) { return 422, @{ error = "Validation failed: Text character limit of $($sites.mastodon.Limit) exceeded" } }
        if ($parent -and !$posts.Contains($parent)) { return 404, @{ error = "Record not found" } }
        return 200, (ConvertTo-Status (Add-Post $text $parent))
    }
    if ($parts.Count -ge 4 -and ($parts[0..2] -join "/") -eq "api/v1/statuses") {
        $id = $parts[3]
        if (!$posts.Contains($id)) { return 404, @{ error = "Record not found" } }
        if ($Method -eq "DELETE" -and $parts.Count -eq 4) { return 200, (ConvertTo-Status (Remove-Post $id)) }
        if ($Method -eq "GET" -and $parts.Count -eq 4) { return 200, (ConvertTo-Status $posts[$id]) }
        if ($Method -eq "GET" -and $parts.Count -eq 5 -and $parts[4] -eq "context") {
            $ancestors = @(Get-Ancestors $id | ForEach-Object { ConvertTo-Status $_ })
            $descendants = @(Get-Descendants $id | ForEach-Object { ConvertTo-Status $_ })
            return 200, [ordered]@{ ancestors = $ancestors; descendants = $descendants }
        }
    }
    404, @{ error = "Not Found" }
}

function Get-BlueskyUri([string] $Id) { "at://did:plc:e2e/app.bsky.feed.post/$Id" }

function Get-Rkey([string] $Uri) { $Uri.Split("/")[-1] }

function ConvertTo-View($Post) {
    [ordered]@{ uri = (Get-BlueskyUri $Post.id); cid = "cid" + $Post.id; record = [ordered]@{ '$type' = "app.bsky.feed.post"; text = $Post.text; createdAt = $Post.created_at } }
}

function ConvertTo-Thread($Post) {
    $replies = @(Get-Children $Post.id | ForEach-Object { ConvertTo-Thread $_ })
    [ordered]@{ '$type' = "app.bsky.feed.defs#threadViewPost"; post = (ConvertTo-View $Post); replies = $replies }
}

function Invoke-Bluesky([string] $Method, [string] $Path, $Body, [bool] $TokenOk, $Query) {
    if ($Path -eq "/xrpc/com.atproto.server.createSession" -and $Method -eq "POST") {
        if ($Body["identifier"] -ceq "e2e.bsky.social" -and $Body["password"] -ceq "e2e-app-password") {
            return 200, [ordered]@{ accessJwt = "bluesky-e2e-token"; refreshJwt = "bluesky-e2e-refresh"; did = "did:plc:e2e"; handle = "e2e.bsky.social" }
        }
        return 401, [ordered]@{ error = "AuthenticationRequired"; message = "Invalid identifier or password" }
    }
    if (!$TokenOk) { return 401, [ordered]@{ error = "AuthenticationRequired"; message = "Authentication Required" } }
    if ($Path -eq "/xrpc/com.atproto.repo.createRecord" -and $Method -eq "POST") {
        $record = $Body["record"] ?? @{}
        $text = ([string]$record["text"]).TrimEnd()
        if ($Body["collection"] -cne "app.bsky.feed.post") { return 400, [ordered]@{ error = "InvalidRequest"; message = "unsupported collection" } }
        if (Test-TooLong bluesky $text) {
            return 400, [ordered]@{ error = "InvalidRequest"; message = "Invalid app.bsky.feed.post record: Record/text must not be longer than $($sites.bluesky.Limit) graphemes" }
        }
        $reply = $record["reply"] ?? @{}
        $parent = Get-Rkey ([string]($reply["parent"] ?? @{})["uri"])
        if (!$parent) { $parent = $null }
        if ($parent -and !$posts.Contains($parent)) { return 400, [ordered]@{ error = "InvalidRequest"; message = "reply parent not found" } }
        $post = Add-Post $text $parent
        return 200, [ordered]@{ uri = (Get-BlueskyUri $post.id); cid = "cid" + $post.id }
    }
    if ($Path -eq "/xrpc/com.atproto.repo.deleteRecord" -and $Method -eq "POST") {
        if (!(Remove-Post ([string]$Body["rkey"]))) { return 400, [ordered]@{ error = "InvalidRequest"; message = "Could not locate record" } }
        return 200, @{}
    }
    if ($Path -eq "/xrpc/app.bsky.feed.getPostThread" -and $Method -eq "GET") {
        $id = Get-Rkey ([string]$Query["uri"])
        if (!$posts.Contains($id)) { return 400, [ordered]@{ error = "NotFound"; message = "Post not found" } }
        return 200, [ordered]@{ thread = (ConvertTo-Thread $posts[$id]) }
    }
    404, [ordered]@{ error = "MethodNotImplemented"; message = "Method Not Implemented" }
}

function Read-Request([IO.Stream] $Stream) {
    $head = [Collections.Generic.List[byte]]::new()
    while ($head.Count -lt 4 -or $head[$head.Count - 4] -ne 13 -or $head[$head.Count - 3] -ne 10 -or $head[$head.Count - 2] -ne 13 -or $head[$head.Count - 1] -ne 10) {
        $b = $Stream.ReadByte()
        if ($b -lt 0) { return $null }
        $head.Add([byte]$b)
    }
    $lines = [Text.Encoding]::ASCII.GetString($head.ToArray()) -split "`r`n" | Where-Object { $_ }
    $method, $target = ($lines[0] -split " ")[0, 1]
    $headers = @{}
    foreach ($line in $lines | Select-Object -Skip 1) { $k, $v = $line -split ":", 2; $headers[$k.Trim()] = $v.Trim() }
    $length = [int]($headers["Content-Length"] ?? 0)
    $body = [byte[]]::new($length)
    $read = 0
    while ($read -lt $length) {
        $n = $Stream.Read($body, $read, $length - $read)
        if ($n -le 0) { break }
        $read += $n
    }
    $path, $query = $target -split "\?", 2
    [pscustomobject]@{ Method = $method; Path = $path; Query = [Web.HttpUtility]::ParseQueryString([string]$query); Headers = $headers; Raw = [Text.Encoding]::UTF8.GetString($body, 0, $read) }
}

function Send-Response([IO.Stream] $Stream, [int] $Status, [string] $Json) {
    $reasons = @{ 200 = "OK"; 400 = "Bad Request"; 401 = "Unauthorized"; 404 = "Not Found"; 422 = "Unprocessable Entity"; 500 = "Internal Server Error" }
    $data = [Text.Encoding]::UTF8.GetBytes($Json)
    $head = [Text.Encoding]::ASCII.GetBytes("HTTP/1.1 $Status $($reasons[$Status])`r`nContent-Type: application/json; charset=utf-8`r`nContent-Length: $($data.Length)`r`nConnection: close`r`n`r`n")
    $Stream.Write($head, 0, $head.Length)
    $Stream.Write($data, 0, $data.Length)
}

function Invoke-Exchange([IO.Stream] $Stream) {
    $request = Read-Request $Stream
    if (!$request) { return }
    $body = @{}
    if ($request.Method -eq "POST" -and ($request.Headers["Content-Type"] ?? "").StartsWith("application/x-www-form-urlencoded")) {
        $form = [Web.HttpUtility]::ParseQueryString($request.Raw)
        foreach ($k in $form.AllKeys) { $body[$k] = $form[$k] }
    } elseif ($request.Method -eq "POST" -and $request.Raw) {
        $body = $request.Raw | ConvertFrom-Json -AsHashtable
    }
    $tokenOk = $request.Headers["Authorization"] -ceq "Bearer $($sites[$Site].Token)"
    $status, $payload = if ($Site -eq "mastodon") { Invoke-Mastodon $request.Method $request.Path $body $tokenOk } else { Invoke-Bluesky $request.Method $request.Path $body $tokenOk $request.Query }
    $row = [ordered]@{ site = $Site; method = $request.Method; path = $request.Path; status = $status; body = $request.Raw } | ConvertTo-Json -Compress
    [IO.File]::AppendAllText($LogPath, "$row`n")
    Send-Response $Stream $status ($payload | ConvertTo-Json -Depth 100 -Compress)
}

function Invoke-SelfTest {
    $cases = @(
        @("plain", "mastodon", "hello", 5),
        @("combining e is one", "bluesky", "e`u{301}", 1),
        @("thumb with tone is one", "bluesky", "`u{1F44D}`u{1F3FD}", 1),
        @("zwj family is one", "bluesky", "`u{1F468}`u{200D}`u{1F469}`u{200D}`u{1F467}", 1),
        @("flag pair is one", "bluesky", "`u{1F1EF}`u{1F1F5}", 1),
        @("two flags are two", "bluesky", "`u{1F1EF}`u{1F1F5}`u{1F1FA}`u{1F1F8}", 2),
        @("crlf is one", "bluesky", "`r`n", 1),
        @("hangul jamo LV is one", "bluesky", "`u{1100}`u{1161}", 1),
        @("cjk counts one each", "mastodon", "`u{65E5}`u{672C}", 2),
        @("mastodon url is 23", "mastodon", "see https://example.com/a/very/long/path/that/goes/on", 27),
        @("mastodon bare domain is text", "mastodon", "example.com", 11),
        @("bluesky url is its graphemes", "bluesky", "https://example.com", 19)
    )
    $limits = @(
        @("mastodon 500 fits", "mastodon", ("a" * 500), $false),
        @("mastodon 501 refused", "mastodon", ("a" * 501), $true),
        @("bluesky 300 fits", "bluesky", ("a" * 300), $false),
        @("bluesky 301 refused", "bluesky", ("a" * 301), $true),
        @("bluesky 300 graphemes over 3000 bytes refused", "bluesky", ("`u{1F468}`u{200D}`u{1F469}" * 300), $true)
    )
    $failed = 0
    foreach ($c in $cases) {
        $got = Get-CountedLength $c[1] $c[2]
        $failed += [int]($got -ne $c[3])
        "$(if ($got -eq $c[3]) { 'ok' } else { 'FAIL' }) $($c[0]): $got (want $($c[3]))"
    }
    foreach ($c in $limits) {
        $got = Test-TooLong $c[1] $c[2]
        $failed += [int]($got -ne $c[3])
        "$(if ($got -eq $c[3]) { 'ok' } else { 'FAIL' }) $($c[0]): $got"
    }
    "$($cases.Count + $limits.Count - $failed)/$($cases.Count + $limits.Count) passed"
    $failed
}

if ($SelfTest) {
    $out = @(Invoke-SelfTest)
    $out | Select-Object -SkipLast 1
    exit ([int]($out[-1] -gt 0))
}
if (!$sites.ContainsKey($Site)) { throw "unknown site $Site; known: $($sites.Keys -join ', ')" }
$server = [Net.Sockets.TcpListener]::new([Net.IPAddress]::Loopback, 0)
$server.Start()
[IO.File]::WriteAllText($PortPath, [string]$server.LocalEndpoint.Port)
while ($true) {
    $client = $server.AcceptTcpClient()
    try { Invoke-Exchange $client.GetStream() }
    catch { [Console]::Error.WriteLine("social_stub: $_") }
    finally { $client.Dispose() }
}
