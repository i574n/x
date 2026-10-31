param([string] $WorldPath, [string] $PortPath, [string] $LogPath)
$ErrorActionPreference = "Stop"
. (Join-Path $PSScriptRoot "stub_http.ps1")

$light = @(@(0, 4351), @(8192, 8205), @(8208, 8223), @(8242, 8247))
$pictograph = '(?:\uD83C[\uDC00-\uDFFF]|\uD83D[\uDC00-\uDFFF]|\uD83E[\uDC00-\uDEFF])'
$symbol = '[©® -⯿〰〽㊗㊙]'
$tone = '\uD83C[\uDFFB-\uDFFF]'
$emoji = [regex]::new("(?:\uD83C[\uDDE6-\uDDFF]){2}|[0-9#*]️?⃣|(?:$pictograph|$symbol️)(?:️|$tone|\uDB40[\uDC20-\uDC7F])*(?:‍(?:$pictograph|$symbol)️?(?:$tone)?)*")
$url = [regex]::new('https?://[a-z0-9-]+(?:\.[a-z0-9-]+)+(?:[/?#][^\s]*?)?(?=[.,!?;:)\]''"]*(?:\s|$))', 'IgnoreCase, CultureInvariant')
$transformedUrlLength = 23

function Get-CodePointWeight([string] $Text) {
    $total = 0
    foreach ($rune in $Text.EnumerateRunes()) {
        $weight = 2
        foreach ($range in $light) { if ($range[0] -le $rune.Value -and $rune.Value -le $range[1]) { $weight = 1; break } }
        $total += $weight
    }
    $total
}

function Get-PlainWeight([string] $Text) {
    $total, $at = 0, 0
    foreach ($m in $emoji.Matches($Text)) {
        $total += (Get-CodePointWeight ($Text.Substring($at, $m.Index - $at))) + 2
        $at = $m.Index + $m.Length
    }
    $total + (Get-CodePointWeight ($Text.Substring($at)))
}

function Get-XWeight([string] $Text) {
    $Text = $Text.Normalize()
    $total, $at = 0, 0
    foreach ($m in $url.Matches($Text)) {
        $total += (Get-PlainWeight ($Text.Substring($at, $m.Index - $at))) + $transformedUrlLength
        $at = $m.Index + $m.Length
    }
    $total + (Get-PlainWeight ($Text.Substring($at)))
}

function Read-Json([string] $Path) { [IO.File]::ReadAllText($Path) | ConvertFrom-Json -AsHashtable -DateKind String }

function Items($Table, [string] $Key) { if ($null -ne $Table -and $Table.Contains($Key)) { $Table[$Key] } }

function Get-Or($Table, [string] $Key, $Default) { if ($null -ne $Table -and $Table.Contains($Key)) { $Table[$Key] } else { $Default } }

$world = Read-Json $WorldPath
$users = [Collections.Generic.List[object]]::new()
foreach ($u in Items $world "users") { $users.Add($u) }
foreach ($extra in Items $world "include") { foreach ($u in Items (Read-Json (Join-Path (Split-Path $WorldPath) $extra)) "users") { $users.Add($u) } }
$usersByHandle = [Collections.Generic.Dictionary[string, object]]::new([StringComparer]::Ordinal)
$usersById = [Collections.Generic.Dictionary[string, object]]::new([StringComparer]::Ordinal)
foreach ($u in $users) { $usersByHandle[$u["username"].ToLowerInvariant()] = $u; $usersById[[string]$u["id"]] = $u }
$postsById = [Collections.Generic.Dictionary[string, object]]::new([StringComparer]::Ordinal)
foreach ($u in $users) {
    foreach ($p in Items $u "posts") {
        $copy = [ordered]@{}
        foreach ($k in $p.get_Keys()) { $copy[$k] = $p[$k] }
        $copy["author_id"] = $u["id"]
        $postsById[[string]$p["id"]] = $copy
    }
}
$created = [ordered]@{}
$script:nextId = 9001
$refreshTokens = [Collections.Generic.List[string]]::new()
$refreshTokens.Add($world["oauth2"]["refresh_token"])

function Get-Percent([string] $Text) { [Uri]::EscapeDataString($Text) }

function Get-OAuth1Signature([string] $Method, [string] $Url, $Params, [string] $ConsumerSecret, [string] $TokenSecret) {
    $pairs = @($Params | ForEach-Object { [pscustomobject]@{ K = (Get-Percent $_[0]); V = (Get-Percent $_[1]) } })
    [Array]::Sort($pairs, [Comparison[object]] { param($a, $b) $c = [string]::CompareOrdinal($a.K, $b.K); $c ? $c : [string]::CompareOrdinal($a.V, $b.V) })
    $base = $Method, (Get-Percent $Url), (Get-Percent (($pairs | ForEach-Object { "$($_.K)=$($_.V)" }) -join "&")) -join "&"
    $hmac = [Security.Cryptography.HMACSHA1]::new([Text.Encoding]::UTF8.GetBytes("$(Get-Percent $ConsumerSecret)&$(Get-Percent $TokenSecret)"))
    [Convert]::ToBase64String($hmac.ComputeHash([Text.Encoding]::UTF8.GetBytes($base)))
}

$docParams = @(
    @("include_entities", "true"), @("status", "Hello Ladies + Gentlemen, a signed OAuth request!"),
    @("oauth_consumer_key", "xvz1evFS4wEEPTGEFPHBog"), @("oauth_nonce", "kYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cg"),
    @("oauth_signature_method", "HMAC-SHA1"), @("oauth_timestamp", "1318622958"),
    @("oauth_token", "370773112-GmHxMAgYyLbNEtIKZeRNFsMKPR9EyMZeS9weJAEb"), @("oauth_version", "1.0")
)
if ((Get-OAuth1Signature "POST" "https://api.x.com/1.1/statuses/update.json" $docParams "kAcSOqF21Fu85e7zjz7ZN2U4ZRhfV3WpwPAoE3Z7kBw" "LswwdoUaIvS8ltyTt5jkRh4J50vUPVVHtR2YPi5kE") -cne "Ls93hJiZbQ3akF3HF3x1Bz8/zU4=") {
    throw "the OAuth 1.0a verifier does not reproduce the published example"
}

function Test-OAuth1([string] $Header, [string] $Method, [string] $Url) {
    $fields = [ordered]@{}
    foreach ($part in $Header.Substring("OAuth ".Length).Split(",")) {
        $k, $v = $part.Trim() -split "=", 2
        $fields[[Uri]::UnescapeDataString($k)] = [Uri]::UnescapeDataString(([string]$v).Trim('"'))
    }
    $o = $world["oauth1"]
    if ($fields["oauth_consumer_key"] -cne $o["consumer_key"] -or $fields["oauth_token"] -cne $o["token"]) { return $false }
    $params = @(foreach ($k in $fields.get_Keys()) { if ($k -cne "oauth_signature") { , @($k, $fields[$k]) } })
    $fields["oauth_signature"] -ceq (Get-OAuth1Signature $Method $Url $params $o["consumer_secret"] $o["token_secret"])
}

function Get-ClientBasic { "Basic " + [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($world["oauth2"]["client_id"] + ":" + $world["oauth2"]["client_secret"])) }

function ConvertFrom-Query([string] $Raw) {
    $query = [Collections.Generic.Dictionary[string, object]]::new([StringComparer]::Ordinal)
    foreach ($pair in $Raw.Split("&")) {
        $k, $v = $pair -split "=", 2
        if ($null -eq $v -or $v -eq "") { continue }
        $name = [Web.HttpUtility]::UrlDecode($k)
        if (!$query.ContainsKey($name)) { $query[$name] = [Collections.Generic.List[string]]::new() }
        $query[$name].Add([Web.HttpUtility]::UrlDecode($v))
    }
    $query
}

function First($Query, [string] $Name, [string] $Default = "") { if ($Query.ContainsKey($Name)) { $Query[$Name][0] } else { $Default } }

function Listed($Query, [string] $Name) { @((First $Query $Name).Split(",") | Where-Object { $_ }) }

function Head([string] $Text, [int] $Length) { $Text.Substring(0, [Math]::Min($Length, $Text.Length)) }

function Slice($List, [int] $Start, [int] $Count) {
    $end = [Math]::Min(@($List).Count, $Start + $Count)
    if ($Start -lt $end) { @($List)[$Start..($end - 1)] }
}

function Sort-Stable($List, [scriptblock] $Key, [switch] $Descending) {
    $sign = $Descending ? -1 : 1
    $items = @($List)
    $rows = @(for ($i = 0; $i -lt $items.Count; $i++) { [pscustomobject]@{ I = $i; K = (& $Key $items[$i]); V = $items[$i] } })
    [Array]::Sort($rows, [Comparison[object]] { param($a, $b) $c = $sign * [string]::CompareOrdinal($a.K, $b.K); $c ? $c : $a.I.CompareTo($b.I) }.GetNewClosure())
    $rows | ForEach-Object { $_.V }
}

function Get-Public($User) { [ordered]@{ id = $User["id"]; name = $User["name"]; username = $User["username"] } }

function Get-Problem([int] $Status, [string] $Title, [string] $Detail) { $Status, [ordered]@{ title = $Title; detail = $Detail; type = "about:blank"; status = $Status } }

function Test-InRange([string] $Text, [int] $Low, [int] $High) { $Text -match '^[0-9]+$' -and [long]$Text -ge $Low -and [long]$Text -le $High }

function Get-Kinds($Post) { @(Items $Post "refs" | ForEach-Object { $_["type"] }) }

$metrics = "bookmark_count", "impression_count", "like_count", "quote_count", "reply_count", "repost_count"

function Get-Escaped([string] $Text) { $Text.Replace("&", "&amp;").Replace("<", "&lt;").Replace(">", "&gt;") }

function Get-Rendered($Post, $Fields) {
    $out = [ordered]@{ id = $Post["id"]; text = (Get-Escaped $Post["text"]); edit_history_post_ids = @(Get-Or $Post "edit_history" @($Post["id"])) }
    if ($Fields -ccontains "conversation_id") { $out["conversation_id"] = Get-Or $Post "conversation_id" $Post["id"] }
    if ($Fields -ccontains "created_at") { $out["created_at"] = $Post["created_at"] }
    if ($Fields -ccontains "author_id") { $out["author_id"] = $Post["author_id"] }
    if ($Fields -ccontains "public_metrics") {
        $counts = [ordered]@{}
        foreach ($k in $metrics) { $counts[$k] = Get-Or (Items $Post "metrics") $k 0 }
        $out["public_metrics"] = $counts
    }
    if ($Fields -ccontains "referenced_posts" -and @(Items $Post "refs").Count) { $out["referenced_posts"] = @(Items $Post "refs") }
    if ($Fields -ccontains "entities" -and @(Items $Post "urls").Count) { $out["entities"] = [ordered]@{ urls = @(Items $Post "urls") } }
    if ($Fields -ccontains "attachments" -and @(Items $Post "media").Count) { $out["attachments"] = [ordered]@{ media_keys = @(Items $Post "media" | ForEach-Object { $_["media_key"] }) } }
    $out
}

function Get-WithExpansions($Posts, $Query) {
    $fields = Listed $Query "post.fields"
    $expansions = Listed $Query "expansions"
    $mediaFields = Listed $Query "media.fields"
    $data = [Collections.Generic.List[object]]::new()
    $included, $authors, $media = [ordered]@{}, [ordered]@{}, [ordered]@{}
    foreach ($post in $Posts) {
        $item = Get-Rendered $post $fields
        if ($expansions -ccontains "referenced_posts" -and @(Items $post "refs").Count) {
            $item["referenced_posts"] = @(Items $post "refs")
            foreach ($r in Items $post "refs") {
                if ($postsById.ContainsKey([string]$r["id"])) {
                    $target = $postsById[[string]$r["id"]]
                    $included[[string]$target["id"]] = Get-Rendered $target $fields
                    if ($expansions -ccontains "referenced_posts.author_id") { $authors[[string]$target["author_id"]] = [ordered]@{ id = $target["author_id"] } }
                }
            }
        }
        if ($expansions -ccontains "attachments.media_keys") {
            foreach ($m in Items $post "media") {
                $kept = [ordered]@{}
                foreach ($k in $m.get_Keys()) { if ($k -ceq "media_key" -or $mediaFields -ccontains $k) { $kept[$k] = $m[$k] } }
                $media[[string]$m["media_key"]] = $kept
            }
        }
        $data.Add($item)
    }
    $body = [ordered]@{}
    if ($data.Count) { $body["data"] = $data.ToArray() }
    $includes = [ordered]@{}
    foreach ($pair in @(@("posts", $included), @("users", $authors), @("media", $media))) { if ($pair[1].Count) { $includes[$pair[0]] = @($pair[1].Values) } }
    if ($includes.Count) { $body["includes"] = $includes }
    $body
}

function Get-UsersBy($Query) {
    $handles = Listed $Query "usernames"
    $found = @($handles | Where-Object { $usersByHandle.ContainsKey($_.ToLowerInvariant()) } | ForEach-Object { Get-Public $usersByHandle[$_.ToLowerInvariant()] })
    $missing = @($handles | Where-Object { !$usersByHandle.ContainsKey($_.ToLowerInvariant()) })
    $body = [ordered]@{}
    if ($found.Count) { $body["data"] = $found }
    if ($missing.Count) {
        $body["errors"] = @($missing | ForEach-Object { [ordered]@{ value = $_; detail = "Could not find user with usernames: [$_]."; title = "Not Found Error"; resource_type = "user"; parameter = "usernames"; type = "https://api.x.com/2/problems/resource-not-found" } })
    }
    200, $body
}

function Get-UsersByIds($Query) { 200, [ordered]@{ data = @(Listed $Query "ids" | Where-Object { $usersById.ContainsKey($_) } | ForEach-Object { Get-Public $usersById[$_] }) } }

function Get-Following($User, $Query) {
    $size = First $Query "max_results" "100"
    if (!(Test-InRange $size 1 1000)) { return Get-Problem 400 "Invalid Request" "max_results must be 1..1000, got $size" }
    $start = [int](First $Query "pagination_token" "p0").Substring(1)
    $count = [Math]::Min([int]$size, [int]$world["following_page_size"])
    $followed = @(Items $User "following" | ForEach-Object { $usersById[[string]$_] })
    $page = @(Slice $followed $start $count)
    $meta = [ordered]@{ result_count = $page.Count }
    if ($start + $count -lt $followed.Count) { $meta["next_token"] = "p$($start + $count)" }
    if ($page.Count) { 200, [ordered]@{ data = @($page | ForEach-Object { Get-Public $_ }); meta = $meta } } else { 200, [ordered]@{ meta = $meta } }
}

function Get-Timeline($User, $Query) {
    $size = First $Query "max_results" "10"
    if (!(Test-InRange $size 5 100)) { return Get-Problem 400 "Invalid Request" "max_results must be 5..100, got $size" }
    if ($User.Contains("plain_status")) { return [int]$User["plain_status"], $User["plain_body"] }
    if ($User.Contains("status")) { return Get-Problem $User["status"] $User["problem_title"] $User["problem_detail"] }
    if (Get-Or $User "protected" $false) {
        return 200, [ordered]@{ errors = @([ordered]@{ title = "Authorization Error"; detail = "Sorry, you are not authorized to see the posts of @$($User["username"])."; type = "https://api.x.com/2/problems/not-authorized-for-resource" }) }
    }
    $excluded = Listed $Query "exclude"
    $since = First $Query "start_time"
    $until = First $Query "end_time"
    $posts = @(Items $User "posts" | ForEach-Object { $postsById[[string]$_["id"]] })
    $posts = @($posts | Where-Object { !($excluded -ccontains "replies" -and (Get-Kinds $_) -ccontains "replied_to") -and !($excluded -ccontains "retweets" -and (Get-Kinds $_) -ccontains "reposted") })
    $posts = @($posts | Where-Object { (!$since -or [string]::CompareOrdinal((Head $_["created_at"] 19), (Head $since 19)) -ge 0) -and (!$until -or [string]::CompareOrdinal((Head $_["created_at"] 19), (Head $until 19)) -lt 0) })
    $newest = @(Slice @(Sort-Stable $posts { $args[0]["created_at"] } -Descending) 0 ([int]$size))
    $body = Get-WithExpansions $newest $Query
    $body["meta"] = [ordered]@{ result_count = $newest.Count }
    200, $body
}

function Get-Lookup($Query) {
    $ids = Listed $Query "ids"
    $body = Get-WithExpansions @($ids | Where-Object { $postsById.ContainsKey($_) } | ForEach-Object { $postsById[$_] }) $Query
    $missing = @($ids | Where-Object { !$postsById.ContainsKey($_) })
    if ($missing.Count) { $body["errors"] = @($missing | ForEach-Object { [ordered]@{ value = $_; detail = "Could not find post with ids: [$_]."; title = "Not Found Error" } }) }
    200, $body
}

function Get-Single([string] $PostId, $Query) {
    if (!$postsById.ContainsKey($PostId)) {
        return 200, [ordered]@{ errors = @([ordered]@{ value = $PostId; detail = "Could not find post with id: [$PostId]."; title = "Not Found Error"; resource_type = "post"; parameter = "id" }) }
    }
    200, [ordered]@{ data = (Get-Rendered $postsById[$PostId] (Listed $Query "post.fields")) }
}

function Get-Now { [DateTimeOffset]::Parse($world["now"], [cultureinfo]::InvariantCulture) }

function Get-WindowStart([int] $Days) { (Get-Now).AddDays(-$Days).ToString("yyyy-MM-dd'T'HH:mm:ss", [cultureinfo]::InvariantCulture) }

function Get-Search($Query, [int] $Days, [bool] $StartTimeWins) {
    $oldest = Get-WindowStart $Days
    $since = Head (First $Query "start_time") 19
    if ($since -and ($StartTimeWins -or [string]::CompareOrdinal($since, $oldest) -gt 0)) { $oldest = $since }
    $terms = @{}
    foreach ($t in (First $Query "query").Split([char[]]" `t`r`n", [StringSplitOptions]::RemoveEmptyEntries)) { if ($t.Contains(":")) { $k, $v = $t -split ":", 2; $terms[$k] = $v } }
    $author = [string]$terms["from"]
    $authorId = $usersByHandle.ContainsKey($author.ToLowerInvariant()) ? $usersByHandle[$author.ToLowerInvariant()]["id"] : $author
    $conversation = $terms["conversation_id"]
    $found = @($postsById.Values | Where-Object { $null -ne $conversation -and (Get-Or $_ "conversation_id" $_["id"]) -ceq $conversation -and (!$author -or $_["author_id"] -ceq $authorId) -and [string]::CompareOrdinal((Head $_["created_at"] 19), $oldest) -ge 0 })
    $found = @(Sort-Stable $found { "{0:D10}|{1}" -f $args[0]["id"].Length, $args[0]["id"] } -Descending)
    $size = [int](First $Query "max_results" "10")
    $start = [int](First $Query "next_token" "0")
    $page = @(Slice $found $start $size)
    $fields = Listed $Query "post.fields"
    $body = [ordered]@{}
    if ($page.Count) { $body["data"] = @($page | ForEach-Object { Get-Rendered $_ $fields }) }
    $meta = [ordered]@{ result_count = $page.Count }
    if ($page.Count) { $meta["newest_id"] = $page[0]["id"]; $meta["oldest_id"] = $page[-1]["id"] }
    if ($start + $size -lt $found.Count) { $meta["next_token"] = [string]($start + $size) }
    $body["meta"] = $meta
    200, $body
}

function Invoke-Get([string] $Path, $Query) {
    $parts = $Path.Trim("/").Split("/")
    $route = $parts -join "/"
    if ($route -ceq "2/users/by") { return Get-UsersBy $Query }
    if ($route -ceq "2/users") { return Get-UsersByIds $Query }
    if ($route -ceq "2/tweets") { return Get-Lookup $Query }
    if ($route -ceq "2/tweets/search/recent") { return Get-Search $Query 7 $false }
    if ($route -ceq "2/tweets/search/all") { return Get-Search $Query 30 $true }
    if ($parts.Count -eq 3 -and $parts[0] -ceq "2" -and $parts[1] -ceq "tweets") { return Get-Single $parts[2] $Query }
    if ($parts.Count -eq 4 -and $parts[0] -ceq "2" -and $parts[1] -ceq "users" -and $usersById.ContainsKey($parts[2])) {
        $user = $usersById[$parts[2]]
        if ($parts[3] -ceq "following") { return Get-Following $user $Query }
        if ($parts[3] -ceq "tweets") { return Get-Timeline $user $Query }
    }
    Get-Problem 404 "Not Found Error" "no route $Path"
}

function Get-UserContextOnly {
    403, [ordered]@{ title = "Unsupported Authentication"; detail = "Authenticating with OAuth 2.0 Application-Only is forbidden for this endpoint.  Supported authentication types are [OAuth 1.0a User Context, OAuth 2.0 User Context]."; type = "https://api.x.com/2/problems/unsupported-authentication"; status = 403 }
}

function Get-Renewed([string] $Raw) {
    $form = ConvertFrom-Query $Raw
    if ((First $form "grant_type") -cne "refresh_token" -or (First $form "refresh_token") -cne $refreshTokens[-1]) {
        return 400, [ordered]@{ error = "invalid_request"; error_description = "Value passed for the token was invalid." }
    }
    $turn = $refreshTokens.Count
    $refreshTokens.Add($world["oauth2"]["refresh_token"] + "-" + $turn)
    200, [ordered]@{ token_type = "bearer"; expires_in = 7200; access_token = $world["oauth2"]["access_token"] + "-" + $turn; scope = "tweet.read tweet.write users.read offline.access"; refresh_token = $refreshTokens[-1] }
}

function New-Post([string] $Raw) {
    $sent = if ($Raw) { $Raw | ConvertFrom-Json -AsHashtable -DateKind String } else { @{} }
    $text = ([string](Get-Or $sent "text" "")).TrimEnd()
    $parent = Get-Or (Get-Or $sent "reply" @{}) "in_reply_to_tweet_id" $null
    if (!$text -or (Get-XWeight $text) -gt 280) { return Get-Problem 400 "Invalid Request" "text must be 1 to 280 characters" }
    if ($parent -and !$postsById.ContainsKey([string]$parent)) { return Get-Problem 400 "Invalid Request" "in_reply_to_tweet_id $parent does not exist" }
    $id = [string]$script:nextId
    $script:nextId++
    $created[$id] = $text
    $conversation = $parent ? (Get-Or $postsById[[string]$parent] "conversation_id" $parent) : $id
    $refs = $parent ? @([ordered]@{ type = "replied_to"; id = $parent }) : @()
    $stamp = (Get-Now).AddSeconds($created.Count).ToString("yyyy-MM-dd'T'HH:mm:ss'.000Z'", [cultureinfo]::InvariantCulture)
    $postsById[$id] = [ordered]@{ id = $id; text = $text; author_id = $world["me"]; created_at = $stamp; conversation_id = $conversation; refs = $refs }
    201, [ordered]@{ data = [ordered]@{ id = $id; text = (Get-Escaped $text); edit_history_post_ids = @($id) } }
}

function Remove-Post([string] $PostId) {
    if (!$created.Contains($PostId)) { return Get-Problem 404 "Not Found Error" "Could not find post with id: [$PostId]." }
    $created.Remove($PostId)
    $null = $postsById.Remove($PostId)
    200, [ordered]@{ data = [ordered]@{ deleted = $true } }
}

function Get-Authorization($Request) {
    $auth = [string]$Request.Headers["Authorization"]
    if ($auth -ceq "Bearer " + $world["token"]) { return "app" }
    if ($auth -ceq "Bearer " + $world["user_token"]) { return "user" }
    if ($auth -ceq (Get-ClientBasic) -and $Request.Path -ceq "/2/oauth2/token") { return "client" }
    if ($auth.StartsWith("OAuth ") -and (Test-OAuth1 $auth $Request.Method ("http://" + $Request.Headers["Host"] + $Request.Path))) { return "oauth1" }
    $null
}

function Invoke-Exchange($Request) {
    $kind = Get-Authorization $Request
    $entry = [ordered]@{ method = $Request.Method; path = $Request.Path; query = $Request.RawQuery; authorized = $null -ne $kind; context = $kind }
    if ($Request.Method -eq "POST") { $entry["body"] = $Request.Raw }
    [IO.File]::AppendAllText($LogPath, ($entry | ConvertTo-Json -Compress) + "`n")
    $parts = $Request.Path.Trim("/").Split("/")
    $status, $body = if ($null -eq $kind) { Get-Problem 401 "Unauthorized" "Unauthorized" }
        elseif ($Request.Method -eq "GET") { Invoke-Get $Request.Path (ConvertFrom-Query $Request.RawQuery) }
        elseif ($Request.Method -eq "POST" -and $kind -ceq "client") { Get-Renewed $Request.Raw }
        elseif ($kind -cne "user" -and $kind -cne "oauth1") { Get-UserContextOnly }
        elseif ($Request.Method -eq "POST" -and $Request.Path -ceq "/2/tweets") { New-Post $Request.Raw }
        elseif ($Request.Method -eq "DELETE" -and $parts.Count -eq 3 -and $parts[0] -ceq "2" -and $parts[1] -ceq "tweets") { Remove-Post $parts[2] }
        else { Get-Problem 404 "Not Found Error" "no route $($Request.Path)" }
    $status, ($body -is [string] ? $body : ($body | ConvertTo-Json -Depth 100 -Compress))
}

Start-StubServer $PortPath { param($r) Invoke-Exchange $r }
