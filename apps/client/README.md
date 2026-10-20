# xc: an X client written in Spiral

`xc` reads X timelines and posts as you, from a terminal or a script. It is a Spiral program compiled to native Rust (one static `xc.exe` on Windows, no runtime to install), talking to the official X API v2.

- **Read:** the latest posts of any accounts as one merged timeline, or the home timeline of an account rebuilt from the accounts it follows.
- **Save money:** date windows and reply/repost filters are sent to the API, so posts you filter out are never returned or billed.
- **See more per post:** expanded urls, media alt text, url titles, and the posts it quotes, replies to or reposts, down to three levels.
- **Stay fair:** `--per-author` keeps quiet accounts visible next to busy ones.
- **Write:** `xc post` and `xc delete`, signed with OAuth 1.0a (keys that never expire) or an OAuth 2.0 user token.
- **Script it:** errors carry the API's own explanation and stable exit codes (0 shown, 2 usage, 3 missing credentials, 4 API failure, with whatever was read before printed first).

Every walkthrough example below is replayed by `e2e/e2e.ps1` against a local stub of the X API and must match character for character, so this page cannot drift from the program. The live samples in section 5 come from the real API.

## 1. Get xc

Download `xc.exe` from the latest run of the `ci` workflow (artifact `xc-windows`), or build it:

```powershell
pwsh scripts/init.ps1        # clones spiral beside this repository when missing
pwsh apps/client/build.ps1   # Spiral -> one Rust crate per entry -> target/release/xc.exe, then the e2e and the test blocks
Set-Alias xc "$PWD/target/release/xc.exe"
```

## 2. Credentials

| What | Environment variables | Where in console.x.com (your app, Keys & Tokens) | Lifetime |
| --- | --- | --- | --- |
| Reading | `X_BEARER_TOKEN` | App-Only Authentication, Bearer Token | until regenerated |
| Posting, OAuth 1.0a | `X_CONSUMER_KEY`, `X_CONSUMER_SECRET`, `X_OAUTH1_ACCESS_TOKEN`, `X_OAUTH1_ACCESS_TOKEN_SECRET` | OAuth 1.0 Keys: Consumer Key (API Key and Secret) and Access Token for your account | until regenerated |
| Posting, OAuth 2.0 | `X_OAUTH2_ACCESS_TOKEN` | OAuth 2.0 Keys, Access Token | 2 hours (a refresh token renews it) |

When all four OAuth 1.0a values are set, `xc` signs writes with them (HMAC-SHA1); otherwise it uses `X_OAUTH2_ACCESS_TOKEN`. The app-only bearer token can never write (the API answers 403). Secrets are only sent as `Authorization` headers to `X_API_BASE_URL` (default `https://api.x.com`) and are never printed.

Keep them in an env file outside any repository; the `KEY=value` format is what `kubectl create secret generic --from-env-file` reads:

```powershell
$secrets = Join-Path $HOME '.secrets/x-api.env'
Add-Content $secrets "X_BEARER_TOKEN=$(Get-Clipboard)"
[Environment]::SetEnvironmentVariable('X_BEARER_TOKEN', (Get-Clipboard), 'User')
```

## 3. Walkthrough

Each command is followed by its exact output: notes and errors (stderr) first, then the timeline (stdout), with empty lines left out. The accounts are the stub's (`e2e/world.json`).

```powershell
xc --help
```

```text
usage: xc timeline [options] USERNAME...
       xc timeline [options] [--max-following N|all] --following USERNAME
       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)
       xc refresh ENV_FILE   renew X_OAUTH2_ACCESS_TOKEN in ENV_FILE with X_OAUTH2_REFRESH_TOKEN
       xc thread ID          the program a thread of framed posts (CELL k/n) carries
       xc post-thread [--dry-run] FILE   post FILE as such a thread (user credentials)
       xc delete-thread ID   delete your posts of that thread (user credentials)
env:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)
       --per-account N   posts fetched per account, 5..100 (default 5)
       --limit N         timeline entries shown (default 20)
       --per-author N    entries shown per author (default all)
       --start-time DATE posts at or after DATE (YYYY-MM-DD, local midnight, or YYYY-MM-DDTHH:MM:SSZ)
       --end-time DATE   posts before DATE
       --no-replies, --no-reposts, --originals (both)
       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)
       --hints           media alt text and url titles under each post
       --json            one JSON object per entry (JSON Lines) instead of text
       --max-following N accounts followed by USERNAME to include, or all (default 20)
```

### Timelines of accounts

Several accounts become one timeline, newest first, each post ending with its reply, repost and like counts (the API's `reply_count`, `repost_count`, `like_count`); times are in the time zone of the machine running `xc` (`TZ` overrides it; this walkthrough runs with `TZ=America/Cuiaba`, UTC-4); posts of the same second are ordered by id, the newer first, and `t.co` links are shown expanded. A leading `@` is accepted; quote it in PowerShell, where a bare `@bob` splats the variable `$bob`:

```powershell
xc timeline alice '@bob'
```

```text
2026-10-15 09:10  @bob  agreed, ramen wins  [1 reply, 0 reposts, 3 likes]
2026-10-15 09:05  @bob  RT @alice: lunch: ramen  [0 replies, 0 reposts, 0 likes]
2026-10-15 08:30  @bob  same minute as alice, newer id  [0 replies, 0 reposts, 0 likes]
2026-10-15 08:30  @alice  lunch: ramen  [2 replies, 1 repost, 14 likes]
2026-10-15 05:45  @bob  shipped v2 release notes soon  [4 replies, 7 reposts, 31 likes]
2026-10-15 04:00  @alice  morning run done  [0 replies, 0 reposts, 0 likes]
2026-10-14 17:10  @alice  reading about typed effects https://example.org/effects  [0 replies, 0 reposts, 0 likes]
```

Unknown accounts are reported and skipped; `--limit` cuts the merged list:

```powershell
xc timeline --limit 2 alice ghost
```

```text
xc: no X account @ghost
2026-10-15 08:30  @alice  lunch: ramen  [2 replies, 1 repost, 14 likes]
2026-10-15 04:00  @alice  morning run done  [0 replies, 0 reposts, 0 likes]
```

### Home timelines

The home timeline of an account, here from the first two accounts it follows:

```powershell
xc timeline --following carol --max-following 2
```

```text
xc: home timeline of @carol from 2 followed accounts
2026-10-15 10:00  @carol  worth reading  [0 replies, 2 reposts, 5 likes]
2026-10-15 09:10  @bob  agreed, ramen wins  [1 reply, 0 reposts, 3 likes]
2026-10-15 09:05  @bob  RT @alice: lunch: ramen  [0 replies, 0 reposts, 0 likes]
2026-10-15 08:30  @bob  same minute as alice, newer id  [0 replies, 0 reposts, 0 likes]
2026-10-15 08:30  @alice  lunch: ramen  [2 replies, 1 repost, 14 likes]
2026-10-15 05:45  @bob  shipped v2 release notes soon  [4 replies, 7 reposts, 31 likes]
2026-10-15 04:00  @alice  morning run done  [0 replies, 0 reposts, 0 likes]
2026-10-15 03:15  @carol  coffee first  [0 replies, 0 reposts, 0 likes]
2026-10-14 17:10  @alice  reading about typed effects https://example.org/effects  [0 replies, 0 reposts, 0 likes]
```

`--max-following all` reads the whole following list (paged until it ends); protected accounts are skipped with a note, and `--per-author` caps what each author shows so quieter accounts are not pushed out:

```powershell
xc timeline --following carol --max-following all --per-author 1
```

```text
xc: home timeline of @carol from 4 followed accounts
xc: skipped @dave: Sorry, you are not authorized to see the posts of @dave.
2026-10-15 11:00  @erin  the whole thread  [0 replies, 0 reposts, 1 like]
2026-10-15 10:00  @carol  worth reading  [0 replies, 2 reposts, 5 likes]
2026-10-15 09:10  @bob  agreed, ramen wins  [1 reply, 0 reposts, 3 likes]
2026-10-15 08:30  @alice  lunch: ramen  [2 replies, 1 repost, 14 likes]
```

An account that follows nobody gets a home timeline of its own posts:

```powershell
xc timeline --following loner --max-following all
```

```text
xc: home timeline of @loner from 0 followed accounts
2026-10-15 06:00  @loner  nobody to follow yet  [0 replies, 0 reposts, 0 likes]
```

### Filters that lower the bill

`--start-time` and `--end-time` are the API's `start_time` and `end_time`; a bare date means midnight in the local time zone:

```powershell
xc timeline --start-time 2026-10-15T12:00:00Z --end-time 2026-10-15T13:06:00Z bob
```

```text
2026-10-15 09:05  @bob  RT @alice: lunch: ramen  [0 replies, 0 reposts, 0 likes]
2026-10-15 08:30  @bob  same minute as alice, newer id  [0 replies, 0 reposts, 0 likes]
```

`--originals` (or `--no-replies`, `--no-reposts`) keeps the authors' own text; `--hints` adds media alt text and url titles:

```powershell
xc timeline --originals --hints alice bob
```

```text
2026-10-15 08:30  @bob  same minute as alice, newer id  [0 replies, 0 reposts, 0 likes]
2026-10-15 08:30  @alice  lunch: ramen  [2 replies, 1 repost, 14 likes]
2026-10-15 05:45  @bob  shipped v2 release notes soon  [4 replies, 7 reposts, 31 likes]
  [photo] release dashboard
2026-10-15 04:00  @alice  morning run done  [0 replies, 0 reposts, 0 likes]
2026-10-14 17:10  @alice  reading about typed effects https://example.org/effects  [0 replies, 0 reposts, 0 likes]
  [url] Typed effects, explained
```

### Reference trees

`--depth` follows quotes, replies and reposts down to three levels; each level past the first is one lookup of those posts, and unknown authors are named with one more lookup:

```powershell
xc timeline --depth 3 --limit 1 erin
```

```text
2026-10-15 11:00  @erin  the whole thread  [0 replies, 0 reposts, 1 like]
  > quoted @carol: worth reading  [0 replies, 2 reposts, 5 likes]
    > quoted @bob: agreed, ramen wins  [1 reply, 0 reposts, 3 likes]
      > replied to @alice: lunch: ramen  [2 replies, 1 repost, 14 likes]
```

With any depth, a repost shows its original once, in full, instead of the truncated `RT @...` text:

```powershell
xc timeline --depth 1 --limit 2 bob
```

```text
2026-10-15 09:10  @bob  agreed, ramen wins  [1 reply, 0 reposts, 3 likes]
  > replied to @alice: lunch: ramen  [2 replies, 1 repost, 14 likes]
2026-10-15 09:05  @bob  reposted @alice: lunch: ramen  [2 replies, 1 repost, 14 likes]
```

### Output for programs

`--json` prints one JSON object per entry (JSON Lines) instead of text, with the counts as numbers, references as `{type, id}` and, with `--depth`, the referenced posts as further objects whose `via` names the post that cites them:

```powershell
xc timeline --json --depth 1 --limit 1 bob
```

```text
{"id":"2004","username":"bob","created_at":"2026-10-15T13:10:00.000Z","text":"agreed, ramen wins","reply_count":1,"repost_count":0,"like_count":3,"refs":[{"type":"replied_to","id":"1002"}],"hints":[],"level":0,"via":""}
{"id":"1002","username":"alice","created_at":"2026-10-15T12:30:00.000Z","text":"lunch: ramen","reply_count":2,"repost_count":1,"like_count":14,"refs":[],"hints":[],"level":1,"via":"2004"}
```

### Programs posted as threads

A program can travel as a thread: each cell is split into posts of at most 280 weighted characters, each post starting with a `CELL k/n` line (the cell's name and the post's place in it, such as `p2 1/6`), and each post replies to the one before it. `xc thread ID` reads the author's posts of that conversation (`conversation_id:` and `from:` in one full-archive search from the root post's `created_at`, paged, so a thread of any age is found: `search/recent` only sees 7 days and `search/all` defaults to 30), keeps the latest version of every edited post (the last id in `edit_history_post_ids`), expands `t.co` links back from the entities, undoes the API's HTML escaping (`&amp;`, `&lt;`, `&gt;`), removes the zero-width spaces `xc post-thread` puts before dots and prints the cells in posting order. This thread was posted by the simulator (`apps/sim`, `mix xsim.world`) from the first cells of `prelude.spi`:

```powershell
xc thread 3000001
```

```text
///- --package .
///- --test static
open testing
open sm'_operators
inl each forall a b. (f : a -> b) (l : list a) : list b =
    listm.foldBack (fun x acc => Cons (f x, acc)) l Nil
inl keep forall t. (ok : t -> bool) (l : list t) : list t =
    listm.foldBack (fun x acc => if ok x then Cons (x, acc) else acc) l Nil
inl spread forall a b. (f : a -> list b) (l : list a) : list b =
    listm.foldBack (fun x acc => listm.append (f x) acc) l Nil
inl first_where forall t. (ok : t -> bool) (l : list t) : option t =
    listm.foldBack (fun x acc => if ok x then Some x else acc) l None
inl has forall t. (ok : t -> bool) (l : list t) : bool =
    match first_where ok l with
    | Some _ => true
    | None => false
inl take_first forall t. (n : i32) (l : list t) : list t =
    let rec go (n : i32) (l : list t) : list t =
        match l with
        | Cons (x, xs) when n > 0 => Cons (x, go (n - 1) xs)
        | _ => Nil
    go n l
inl then_ok forall a b e. (f : a -> result b e) (r : result a e) : result b e =
    match r with
    | Ok x => f x
    | Error e => Error e
inl map_ok forall a b e. (f : a -> b) (r : result a e) : result b e = then_ok (f >> Ok) r
inl cut (start : i32) (len : i32) (s : string) : string = sm'.substring start len s
let rec split_on (sep : string) (s : string) : list string =
    inl i : i32 = sm'.index_of sep s
    if i < 0i32 then [s]
    else Cons (cut 0i32 i s, split_on sep (cut (i + 1i32) (sm'.length s - i - 1i32) s))
inl pieces (sep : string) (s : string) : list string = if s = "" then Nil else split_on sep s
let delimited (sep : string) (l : list string) : string = sm'.concat_list sep l
inl digit_at (i : i32) (text : string) : i32 =
    "0123456789" |> sm'.index_of (sm'.slice i i text)
let rec digits (text : string) (i : i32) (n : i32) : option i32 =
    if i >= sm'.length text then Some n
    else
        inl d = digit_at i text
        if d < 0 || n > 100000000 then None else digits text (i + 1) (n * 10 + d)
inl without_digits (text : string) : string = listm.init 10i32 id |> listm.fold (fun t d => sm'.replace (sm'.obj_to_string d) "" t) text
let count_of_text (text : string) : option i32 =
    if text = "" || without_digits text <> "" then None else digits text 0 0
```

A post that does not exist:

```powershell
xc thread 999; $LASTEXITCODE
```

```text
xc: X API answered 404 for /2/tweets/999?post.fields=conversation_id,author_id,created_at: Could not find post with id: [999].
4
```

A cell with a missing post is left out and named, and the exit code is 4. A cell lost with all its posts cannot be named, but the cell after it replies to a post that is not in the thread, so that cell is named instead (exit 4); a lost cell nothing replies to stays invisible. The e2e also reads back a thread of all of `posts.spi` with 3 rounds of edits and editing personas (one cell spans 48 posts and is rebuilt from its latest versions), and a copy of the thread above with a lost post, and checks each program byte for byte against the simulator's own record of what it posted.

### Empty and partial results

An empty result says so:

```powershell
xc timeline quiet
```

```text
xc: no posts matched
```

If the API stops answering part way (out of credits, rate limited), what was already read is still shown, then the reason, with exit code 4:

```powershell
xc timeline --following mixed --max-following all; $LASTEXITCODE
```

```text
xc: home timeline of @mixed from 3 followed accounts
xc: stopped early, showing what was read before: X API answered 429 for /2/users/107/tweets?max_results=5&post.fields=created_at,author_id,public_metrics,entities,attachments: Too Many Requests
2026-10-15 08:30  @alice  lunch: ramen  [2 replies, 1 repost, 14 likes]
2026-10-15 07:00  @mixed  reading what i can  [0 replies, 0 reposts, 0 likes]
2026-10-15 04:00  @alice  morning run done  [0 replies, 0 reposts, 0 likes]
2026-10-14 17:10  @alice  reading about typed effects https://example.org/effects  [0 replies, 0 reposts, 0 likes]
4
```

### Posting and deleting

With an OAuth 2.0 user token (`X_OAUTH2_ACCESS_TOKEN`):

```powershell
xc post "hello from xc"
```

```text
posted 9001
```

```powershell
xc delete 9001
```

```text
deleted 9001
```

With OAuth 1.0a keys, every write is signed (the stub verifies the HMAC-SHA1 signature with Python's own implementation, which first reproduces X's published example):

```powershell
$env:X_OAUTH2_ACCESS_TOKEN = $null; $env:X_CONSUMER_KEY = 'e2e-consumer-key'; $env:X_CONSUMER_SECRET = 'e2e-consumer-secret'; $env:X_OAUTH1_ACCESS_TOKEN = '110-e2e-access-token'; $env:X_OAUTH1_ACCESS_TOKEN_SECRET = 'e2e-access-token-secret'; xc post "signed: 100% & done"; xc delete 9002
```

```text
posted 9002
deleted 9002
```

A wrong secret makes the signature invalid:

```powershell
$env:X_OAUTH2_ACCESS_TOKEN = $null; $env:X_CONSUMER_KEY = 'e2e-consumer-key'; $env:X_CONSUMER_SECRET = 'not-the-secret'; $env:X_OAUTH1_ACCESS_TOKEN = '110-e2e-access-token'; $env:X_OAUTH1_ACCESS_TOKEN_SECRET = 'e2e-access-token-secret'; xc post "forged"; $LASTEXITCODE
```

```text
xc: X API answered 401 for /2/tweets: Unauthorized
4
```

The app-only token cannot post; the API's own refusal is shown:

```powershell
$env:X_OAUTH2_ACCESS_TOKEN = $env:X_BEARER_TOKEN; xc post "with the app token"; $LASTEXITCODE
```

```text
xc: X API answered 403 for /2/tweets: Unsupported Authentication: Authenticating with OAuth 2.0 Application-Only is forbidden for this endpoint.  Supported authentication types are [OAuth 1.0a User Context, OAuth 2.0 User Context].
4
```

```powershell
$env:X_OAUTH2_ACCESS_TOKEN = $null; xc post "no user credentials"; $LASTEXITCODE
```

```text
xc: posting needs user credentials: X_CONSUMER_KEY, X_CONSUMER_SECRET, X_OAUTH1_ACCESS_TOKEN and
    X_OAUTH1_ACCESS_TOKEN_SECRET (OAuth 1.0a, never expire), or X_OAUTH2_ACCESS_TOKEN (OAuth 2.0, 2 hours)
3
```

### Posting a program as a thread

`xc post-thread FILE` is the other half of `xc thread`: it cuts FILE into cells at each blank line that comes before a line starting at column 0, splits each cell into `CELL k/n` posts of at most 280 weighted characters (CJK and emoji weigh 2), cuts between words, never ends a post on whitespace (X trims it), and posts them as one reply chain. X turns anything that looks like a domain into a `t.co` link and keeps no trace of how it was written (`listm.map` and `https://listm.map` come back with the same entities), so a dot between a letter or digit and a letter gets a zero-width space (U+200B, weight 1) before it: X links nothing and `xc thread` removes the spaces. `--dry-run` shows the posts and what creating them costs without sending anything:

```powershell
xc post-thread --dry-run checks/checks.spi
```

```text
--- post 1 of 7, weight 47
c1 1/1
open sm'_operators
open prelude
open cli
--- post 2 of 7, weight 114
c2 1/1
inl count_or_none (t : string) : i32 =
    match count_of_text t with
    | Some n => n
    | None => -1i32
--- post 3 of 7, weight 107
c3 1/1
inl text_or_empty (o : option string) : string =
    match o with
    | Some s => s
    | None => ""
--- post 4 of 7, weight 88
c4 1/1
inl local_midnight (day : string) : string = $'xc_net::xc_local_midnight(&*!day)'
--- post 5 of 7, weight 135
c5 1/1
inl date_or_empty (t : string) : string =
    if shaped "9999-99-99" t then local_midnight t else text_or_empty (date_of_text t)
--- post 6 of 7, weight 88
c6 1/1
inl username_or_empty (t : string) : string = username_of_text t |> text_or_empty
--- post 7 of 7, weight 266
c7 1/1
inl main () : i32 =
    !!!!Export("xc_count", ((fun t => count_or_none t) : string -> i32))
    !!!!Export("xc_date", ((fun t => date_or_empty t) : string -> string))
    !!!!Export("xc_username", ((fun t => username_or_empty t) : string -> string))
    0i32
--- 7 posts, $0.105 to create
```

With user credentials it posts, one line per post with its id:

```powershell
xc post-thread checks/checks.spi
```

```text
posted 9003 c1 1/1
posted 9004 c2 1/1
posted 9005 c3 1/1
posted 9006 c4 1/1
posted 9007 c5 1/1
posted 9008 c6 1/1
posted 9009 c7 1/1
```

Reading the thread back gives the file again, with the trailing whitespace X drops at the end of a cell removed:

```powershell
xc thread 9003
```

```text
open sm'_operators
open prelude
open cli
inl count_or_none (t : string) : i32 =
    match count_of_text t with
    | Some n => n
    | None => -1i32
inl text_or_empty (o : option string) : string =
    match o with
    | Some s => s
    | None => ""
inl local_midnight (day : string) : string = $'xc_net::xc_local_midnight(&*!day)'
inl date_or_empty (t : string) : string =
    if shaped "9999-99-99" t then local_midnight t else text_or_empty (date_of_text t)
inl username_or_empty (t : string) : string = username_of_text t |> text_or_empty
inl main () : i32 =
    !!!!Export("xc_count", ((fun t => count_or_none t) : string -> i32))
    !!!!Export("xc_date", ((fun t => date_or_empty t) : string -> string))
    !!!!Export("xc_username", ((fun t => username_or_empty t) : string -> string))
    0i32
```

`xc delete-thread ID` removes your posts of the thread again, replies first:

```powershell
xc delete-thread 9003
```

```text
deleted 9009
deleted 9008
deleted 9007
deleted 9006
deleted 9005
deleted 9004
deleted 9003
```

### Renewing the OAuth 2.0 token

An OAuth 2.0 access token lasts 2 hours. `xc refresh FILE` trades `X_OAUTH2_REFRESH_TOKEN` for a new access token and a new refresh token (X accepts each refresh token once) and rewrites those two lines of the env file in place, keeping every other line; nothing secret is printed:

```powershell
Push-Location ([IO.Path]::GetTempPath()); Set-Content xc-refresh.env "X_BEARER_TOKEN=kept`nX_OAUTH2_ACCESS_TOKEN=old`nX_OAUTH2_REFRESH_TOKEN=e2e-refresh-token"; $env:X_OAUTH2_CLIENT_ID = 'e2e-client-id'; $env:X_OAUTH2_CLIENT_SECRET = 'e2e-client-secret'; $env:X_OAUTH2_REFRESH_TOKEN = 'e2e-refresh-token'; xc refresh xc-refresh.env; (Get-Content xc-refresh.env) -replace '=.*', '=...'; Pop-Location
```

```text
renewed X_OAUTH2_ACCESS_TOKEN and X_OAUTH2_REFRESH_TOKEN in xc-refresh.env; the access token expires in 7200 s
X_BEARER_TOKEN=...
X_OAUTH2_ACCESS_TOKEN=...
X_OAUTH2_REFRESH_TOKEN=...
```

The spent refresh token is refused:

```powershell
Push-Location ([IO.Path]::GetTempPath()); $env:X_OAUTH2_CLIENT_ID = 'e2e-client-id'; $env:X_OAUTH2_CLIENT_SECRET = 'e2e-client-secret'; $env:X_OAUTH2_REFRESH_TOKEN = 'e2e-refresh-token'; xc refresh xc-refresh.env; $LASTEXITCODE; Pop-Location
```

```text
xc: X API answered 400 for /2/oauth2/token: Value passed for the token was invalid.
4
```

The file now holds the next refresh token, so loading it again is all the next renewal needs:

```powershell
Push-Location ([IO.Path]::GetTempPath()); $env:X_OAUTH2_CLIENT_ID = 'e2e-client-id'; $env:X_OAUTH2_CLIENT_SECRET = 'e2e-client-secret'; $env:X_OAUTH2_REFRESH_TOKEN = (Get-Content xc-refresh.env | Where-Object { $_ -like 'X_OAUTH2_REFRESH_TOKEN=*' }) -replace '^[^=]*=', ''; xc refresh xc-refresh.env; Remove-Item xc-refresh.env; Pop-Location
```

```text
renewed X_OAUTH2_ACCESS_TOKEN and X_OAUTH2_REFRESH_TOKEN in xc-refresh.env; the access token expires in 7200 s
```

### Errors and exit codes

```powershell
xc timeline broke; $LASTEXITCODE
```

```text
xc: X API answered 402 for /2/users/106/tweets?max_results=5&post.fields=created_at,author_id,public_metrics,entities,attachments: CreditsDepleted: Your enrolled account does not have any credits to fulfill this request.
4
```

```powershell
$env:X_BEARER_TOKEN = $null; xc timeline alice; $LASTEXITCODE
```

```text
xc: X_BEARER_TOKEN is not set; generate the app's bearer token at https://console.x.com
3
```

```powershell
xc timeline --per-account 500 alice; $LASTEXITCODE
```

```text
xc: --per-account expects a number from 5 to 100, got '500'
usage: xc timeline [options] USERNAME...
       xc timeline [options] [--max-following N|all] --following USERNAME
       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)
       xc refresh ENV_FILE   renew X_OAUTH2_ACCESS_TOKEN in ENV_FILE with X_OAUTH2_REFRESH_TOKEN
       xc thread ID          the program a thread of framed posts (CELL k/n) carries
       xc post-thread [--dry-run] FILE   post FILE as such a thread (user credentials)
       xc delete-thread ID   delete your posts of that thread (user credentials)
env:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)
       --per-account N   posts fetched per account, 5..100 (default 5)
       --limit N         timeline entries shown (default 20)
       --per-author N    entries shown per author (default all)
       --start-time DATE posts at or after DATE (YYYY-MM-DD, local midnight, or YYYY-MM-DDTHH:MM:SSZ)
       --end-time DATE   posts before DATE
       --no-replies, --no-reposts, --originals (both)
       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)
       --hints           media alt text and url titles under each post
       --json            one JSON object per entry (JSON Lines) instead of text
       --max-following N accounts followed by USERNAME to include, or all (default 20)
2
```

## 4. What a run costs

Pay-per-use prices (docs.x.com, October 2026): $0.010 per user returned by a lookup, $0.010 per account returned by a following list, $0.005 per post returned, $0.015 per post created; a resource read again within the same UTC day is billed once.

| Run | Requests | Worst case |
| --- | --- | --- |
| `xc timeline a b` (defaults) | 1 lookup + 2 post reads | $0.02 + 10 posts = $0.07 |
| `xc timeline --following h` (cap 20) | 1 lookup + 1 following page + 21 post reads | $0.01 + $0.20 + 105 posts = $0.735 |
| `xc timeline --following h --max-following all` (500 follows) | 1 lookup + 1 following page + 501 post reads | $0.01 + $5.00 + 2,505 posts = $17.535 |
| `xc thread ID` (a 115-post thread, edit versions included) | 1 post lookup + 2 search pages | 116 posts = $0.58 |

Reply, repost and like counts come with every post read: they are the `public_metrics` field in the `post.fields` the requests already send, so they add no request and no billed resource, only about 120 bytes per post. The API returns six counters (`reply_count`, `repost_count`, `like_count`, `quote_count`, `bookmark_count`, `impression_count`); `xc` shows the first three.

`--start-time`, `--end-time` and `--originals` lower the post term; `--per-author` and `--limit` only change what is shown. `--depth N` adds up to N-1 lookups of referenced posts and one user lookup.

## 5. Live samples

Captured from the real API on 2026-10-16 11:40 (UTC-4) with this build. NASA posts are US government works.

Hints show the alt text NASA writes for its photos and the titles of linked pages:

```console
> xc timeline --limit 4 --hints NASA
2026-10-16 09:53  @NASA  “It was the greatest adventure that four humans can ever go on.”  Listen to Artemis II's Christina Koch and Reid Wiseman reflect on their historic, 10-day journey around the Moon in a recent episode of Houston We Have a Podcast: https://go.nasa.gov/3VTEjr2 https://x.com/NASA/status/2111093273800356092/photo/1  [61 replies, 75 reposts, 539 likes]
  [photo] The thumbnail for Houston We Have a Podcast Episode 440, "To the Moon and Back Again With Reid and Christina." It includes Reid Wiseman and Christina Koch posing in front of imagery from the Artemis II mission, including the moment of launch and a crisp shot of the Moon.
  [url] To the Moon and Back Again - NASA
2026-10-15 16:36  @NASA  @StCroixSkol 🙌  [0 replies, 0 reposts, 10 likes]
2026-10-15 16:03  @NASA  LIVE: Tune in as agency leaders and partners discuss NASA's contributions to @JAXA_en's Martian Moons eXploration (MMX) mission, scheduled to lift off on Monday, Oct. 19. https://youtu.be/3k2mpWrOD1s https://x.com/NASA/status/2110823965954637903/photo/1  [63 replies, 132 reposts, 929 likes]
  [photo] The blue NASA "meatball" insignia overlaid on top of a Martian background.
  [url] NASA's Role in the Martain Moons eXploration (MMX) Mission (October 15, 2026)
2026-10-15 15:30  @NASA  LIVE: Members of Crew-12 are at @NASAJohnson to discuss their mission aboard the @Space_Station and answer questions from the media. The crew spent 237 days living and working in orbit and returned to Earth on Thursday, Oct. 8. https://x.com/i/broadcasts/1qxvveyYAqWxB  [77 replies, 138 reposts, 939 likes]
  [url] NASA
```

`--originals` dropped the reply above; `--per-author 2` lets a third account in:

```console
> xc timeline --originals --per-author 2 --limit 4 NASA NASAWebb NASAHubble
2026-10-16 10:39  @NASAHubble  Twinkle, twinkle little galaxy…  NGC 1827 is a low-mass galaxy that was captured as part of a Hubble observing program that will help scientists test predictions of cosmological models on smaller scales: https://go.nasa.gov/4i3feRM https://x.com/NASAHubble/status/2111104814251712620/photo/1  [8 replies, 70 reposts, 403 likes]
2026-10-16 09:53  @NASA  “It was the greatest adventure that four humans can ever go on.”  Listen to Artemis II's Christina Koch and Reid Wiseman reflect on their historic, 10-day journey around the Moon in a recent episode of Houston We Have a Podcast: https://go.nasa.gov/3VTEjr2 https://x.com/NASA/status/2111093273800356092/photo/1  [61 replies, 75 reposts, 539 likes]
2026-10-15 16:03  @NASA  LIVE: Tune in as agency leaders and partners discuss NASA's contributions to @JAXA_en's Martian Moons eXploration (MMX) mission, scheduled to lift off on Monday, Oct. 19. https://youtu.be/3k2mpWrOD1s https://x.com/NASA/status/2110823965954637903/photo/1  [63 replies, 132 reposts, 929 likes]
2026-10-15 12:57  @NASAHubble  @NASARoman Hubble can follow up on Roman's much wider views in greater detail, and in different types of light. Each telescope picks up complementary info!  You can think of Roman as a wide-angle camera viewing a broad landscape, and Hubble as a zoom lens in ultraviolet and visible light:  [0 replies, 12 reposts, 85 likes]
```

Reposts show the original in full, quotes are followed:

```console
> xc timeline --depth 2 --limit 3 NASA_Astronauts
2025-06-20 11:03  @NASA_Astronauts  This account is now archived, but the mission continues. 🚀 For official updates about @NASA astronauts, follow @Space_Station 🛰️, @NASA_Johnson 🌍, and our individual astronaut accounts listed at http://nasa.gov/social-media. 👨‍🚀 👩‍🚀 https://x.com/NASA_Astronauts/status/1936077425344929970/photo/1  [62 replies, 63 reposts, 474 likes]
2025-06-20 10:23  @NASA_Astronauts  reposted @JonnyKimUSA: Caught a fish! Hope you enjoy this round of space fishing for beautiful auroras. If you’re wondering what the reflections in the lower left are, I made a rookie mistake of not having the shroud completely cover the window so you can see some crew activity (the cupola is located https://x.com/JonnyKimUSA/status/1936066582217642158/video/1  [47 replies, 217 reposts, 1140 likes]
2025-06-18 15:16  @NASA_Astronauts  Lightning from Hurricane Erick, captured by @Astro_Ayers while orbiting Earth aboard the @Space_Station. 🌩 https://twitter.com/Astro_Vapor/status/1935415114402033715  [7 replies, 11 reposts, 111 likes]
  > quoted @Astro_Vapor: We flew over Hurricane Erick this morning (last night for those on Earth), and I caught some of the lightning in the storm. I shoot these at 120 frames per second, and this bolt of lightning stuck around for over 40 frames!   In these pictures, you can see the clear bolt outline, https://x.com/Astro_Ayers/status/1935415114402033715/photo/1  [14 replies, 43 reposts, 346 likes]
```

## 6. Possibilities

What you can build on `xc` today:

- **Watch accounts cheaply:** a scheduled `xc timeline --start-time <yesterday> --originals a b c` only pays for new original posts.
- **Read someone's home timeline** without their login: `--following h` rebuilds it from the accounts they follow (cap it; follows cost $0.010 each).
- **Follow conversations:** `--depth 3` shows what a post quotes, answers or reposts.
- **Post from scripts or CI:** `xc post` and `xc delete` with OAuth 1.0a keys that never expire, exit codes for every failure; `xc refresh` renews an OAuth 2.0 user token in place.
- **Publish a program as a thread:** `xc post-thread FILE` (try `--dry-run` first, remove it with `xc delete-thread ID`), and anyone reads it back with `xc thread ID`: any age, latest edits, missing posts and missing cells named. `xc`'s own source travels this way: every top-level definition fits 280 weight (`edition: 3`), and with its `CELL k/n` header line all but 40 cells fit one post (1029 posts for the whole client; `build.ps1` names the cells that need two). To run what a thread carries, save it (`xc thread ID > program.spi`) and, from `apps/sim`, `mix xsim.thread_run --file ../client/oauth1.spi --program program.spi` evaluates both under Cells and passes only when the thread has the file's cells and every test verdict matches.
- **Agents as users:** `--json` gives one JSON object per entry, so an agent can call `xc` as a tool.
- **Run anywhere:** one static binary; credentials only from environment variables, so a Kubernetes secret maps onto it directly.

Where it is going (backlog items in i574n.github/docs/backlog):

- **Running what a thread carries** (X-CLIENT-THREADS): hand the rebuilt program to Cells and report its test results.
- **The simulated world** (`apps/sim`, SIM-IN-SPIRAL): many users posting, editing, liking and breaking Spiral cells, with delayed and duplicated deliveries, recorded as a versioned event stream (`apps/sim/fixtures`); the live client is its real-world counterpart. Rewritten in Spiral alongside Cells.
- **X as NEAR contracts** (X-ON-NEAR, X-FEDERATION-BRIDGES): the simulator as spec and oracle for a contract rewrite that stays Mastodon and Bluesky compatible.

## 7. How it is built

Shared modules, compiled into every crate that opens them:

| Module | Role |
| --- | --- |
| `prelude.spi` | list, result and text-splitting helpers; `cut` slices UTF-8 bytes on every backend |
| `glyphs.spi` | the only per-backend text primitives (graphemes, NFC, X weights, whitespace, code points) as Rust/Gleam pairs, so everything above them compiles to both |
| `protocol.spi` | the `cN k/n` frame header, rendered by the writer and parsed by the reader from one definition (`header_rejection` says why a line is no header), and `thread_flaw` (`MissingFrames`, `ReplyGap`) with its notes and exit code |
| `splitter.spi` | a file to its cells and each cell to posts of at most 280 weight: link dots defused, cuts between words, the `--dry-run` preview and price |
| `posts.spi` | posts, references, urls and media; display entries and their one-line form between crates; newest-first merge sort, per-author caps, reference trees and hints |
| `reading.spi` | the reading side of `splitter`: a posted text back to its header and body (link dots restored), frames grouped into cells in posting order, and each cell `Whole` (its source) or `Holed` (a `thread_flaw`) |
| `cli.spi` | arguments to a typed command (`ShowTimeline`, `PublishPost`, `RemovePost`) with filters and views; validators arrive as a `checks` record |
| `oauth1.spi` | OAuth 1.0a: RFC 3986 percent-encoding, the signature base string, HMAC-SHA1 (`hmac`, `sha1`, `base64` crates) |
| `wire.spi` | `reads r` and `writes r`, GADTs indexed by their reply, so a request determines its reply type; `api app_context` and `api user_context`, so a client built from the app token cannot write; JSON (`serde_json`) primitives; typed failures |
| `transport.spi` | requests through `xc_net`, reply classification, `id:username` account lines |

Each entry is one Rust crate, so every generated file stays reviewable (`scripts/gate.ps1` reports generated lines against 1000), and the build reports the compiler's `--x-compat` findings, so every top-level definition fits one 280-weight post. Crates exchange strings, numbers and tuples:

| Crate | Entry | Role |
| --- | --- | --- |
| `xc_net` | `net/net.spi` | HTTP (`ureq`), OAuth 1.0a headers, nonces, clock and local time (`jiff`) |
| `xc_checks` | `checks/checks.spi` | count, date and username validators; a bare date becomes local midnight |
| `xc_args` | `args/args.spi` | process arguments to command fields, usage text |
| `xc_users` | `users/users.spi` | username lookup, followed accounts with paging, lookup by id |
| `xc_fetch` | `fetch/fetch.spi` | each account's posts, with the ids they reference |
| `xc_refs` | `refs/refs.spi` | referenced posts, level by level up to `--depth` |
| `xc_write` | `write/write.spi` | posting and deleting with user credentials, threads as reply chains, a thread's posts deleted in one call |
| `xc_digest` | `digest/digest.spi` | rebuilds posts from the gathered replies and writes each as a display entry line (author, text, counts, hints, references) |
| `xc_view` | `view/view.spi` | reads entry lines, selects them and renders the timeline with its reference trees |
| `xc_jsonl` | `jsonl/jsonl.spi` | the same selection as JSON Lines (`--json`) |
| `xc_thread` | `thread/thread.spi` | a thread's root post and the author's posts of its conversation, paged from the root's time (`xc thread`), and their latest ids (`xc delete-thread`) |
| `xc_locate` | `locate/locate.spi` | a thread's pages to located frames: latest edit versions, links expanded, headers parsed, every known post id |
| `xc_assemble` | `assemble/assemble.spi` | glue: located frames from JSON through `reading`, so missing frames and lost cells are named, never rebuilt |
| `xc_frames` | `frames/frames.spi` | glue: the splitter's posts as JSON with their weights, and the preview |
| `xc_token` | `token/token.spi` | OAuth 2.0 token renewal and the in-place env file rewrite (`xc refresh`) |
| `xc` | `xc/xc.spi` | entry: environment, credentials, the order of calls, exit codes, output |

Tests: the test blocks of `glyphs`, `protocol`, `splitter` and `reading` run on both Rust (with the `unicode-segmentation` and `unicode-normalization` crates) and Gleam, and must print the same, which is how the splitter is kept ready for the simulator's BEAM port; `reading`'s post a file with CJK, a link-like dot and a long cell, read the posts back and must get exactly the file's cells, and a dropped post must leave its cell `Holed`; those of `prelude`, `posts`, `cli`, `wire` and `transport` run on Zig; `oauth1`'s run on Rust (std only) and check the base string against X's published example; `wire`'s decoder tests run on Rust with `serde_json` (`///> rust -d serde_json`) over small JSON documents; negative tests prove that a users lookup is not a posts read, a deletion does not reply with a created post, the app token cannot write, and an app context cannot be signed with OAuth 1.0a keys. The e2e replays this page against `e2e/stub.py` (`e2e/e2e.ps1 -Accept` rewrites its outputs after an intended change; review the diff), whose world includes four threads the simulator posted (complete, edited three times, missing one post, missing a whole cell) (`e2e/sim-*.world.json`, regenerated and compared by `apps/sim/build.ps1`, rewritten by its `-Accept` after the posted sources change), and checks `xc thread` against the simulator's record of each program (`e2e/sim-*.expected.json`); `xc post-thread` must write exactly the posts the simulator's own splitter makes of `oauth1.spi` (`e2e/thread-oauth1.expected.json`, from `mix xsim.frames`), each replying to the one before, `xc thread` must read the file back, and `xc delete-thread` must remove every one of those posts. Like X, the stub trims trailing whitespace from posts and returns text with `&`, `<` and `>` HTML-escaped.
