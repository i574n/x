# xc: an X client written in Spiral

`xc` reads X timelines and posts as you, from a terminal or a script. It is a Spiral program compiled to native Rust (one static `xc.exe` on Windows, no runtime to install), talking to the official X API v2.

- **Read:** the latest posts of any accounts as one merged timeline, or the home timeline of an account rebuilt from the accounts it follows.
- **Save money:** date windows and reply/repost filters are sent to the API, so posts you filter out are never returned or billed.
- **See more per post:** expanded links, photo and video descriptions, link titles, and the posts it quotes, replies to or reposts, down to three levels.
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
| Posting, OAuth 2.0 | `X_USER_TOKEN` | OAuth 2.0 Keys, Access Token | 2 hours (a refresh token renews it) |

When all four OAuth 1.0a values are set, `xc` signs writes with them (HMAC-SHA1); otherwise it uses `X_USER_TOKEN`. The app-only bearer token can never write (the API answers 403). Secrets are only sent as `Authorization` headers to `X_API_BASE_URL` (default `https://api.x.com`) and are never printed.

Keep them in an env file outside any repository; the `KEY=value` format is what `kubectl create secret generic --from-env-file` reads:

```powershell
$secrets = Join-Path $HOME '.secrets/x-api.env'
Add-Content $secrets "X_BEARER_TOKEN=$(Get-Clipboard)"
[Environment]::SetEnvironmentVariable('X_BEARER_TOKEN', (Get-Clipboard), 'User')
```

## 3. Walkthrough

Each command is followed by its exact output: notes and errors (stderr) first, then the timeline (stdout). The accounts are the stub's (`e2e/world.json`).

```powershell
xc --help
```

```text
usage: xc timeline [options] HANDLE...
       xc timeline [options] [--max-following N|all] --following HANDLE
       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_USER_TOKEN)
env:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)
       --per-account N   posts fetched per account, 5..100 (default 5)
       --limit N         timeline entries shown (default 20)
       --per-author N    entries shown per author (default all)
       --since DATE      posts at or after DATE (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ)
       --until DATE      posts before DATE
       --no-replies, --no-reposts, --originals (both)
       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)
       --hints           media and link titles under each post
       --max-following N accounts followed by HANDLE to include, or all (default 20)
```

### Timelines of accounts

Several accounts become one timeline, newest first; posts of the same second are ordered by id, the newer first, and `t.co` links are shown expanded. A leading `@` is accepted; quote it in PowerShell, where a bare `@bob` splats the variable `$bob`:

```powershell
xc timeline alice '@bob'
```

```text
2026-10-15 13:10  @bob  agreed, ramen wins
2026-10-15 13:05  @bob  RT @alice: lunch: ramen
2026-10-15 12:30  @bob  same minute as alice, newer id
2026-10-15 12:30  @alice  lunch: ramen
2026-10-15 09:45  @bob  shipped v2 release notes soon
2026-10-15 08:00  @alice  morning run done
2026-10-14 21:10  @alice  reading about typed effects https://example.org/effects
```

Unknown accounts are reported and skipped; `--limit` cuts the merged list:

```powershell
xc timeline --limit 2 alice ghost
```

```text
xc: no X account @ghost
2026-10-15 12:30  @alice  lunch: ramen
2026-10-15 08:00  @alice  morning run done
```

### Home timelines

The home timeline of an account, here from the first two accounts it follows:

```powershell
xc timeline --following carol --max-following 2
```

```text
xc: home timeline of @carol from 2 followed accounts
2026-10-15 14:00  @carol  worth reading
2026-10-15 13:10  @bob  agreed, ramen wins
2026-10-15 13:05  @bob  RT @alice: lunch: ramen
2026-10-15 12:30  @bob  same minute as alice, newer id
2026-10-15 12:30  @alice  lunch: ramen
2026-10-15 09:45  @bob  shipped v2 release notes soon
2026-10-15 08:00  @alice  morning run done
2026-10-15 07:15  @carol  coffee first
2026-10-14 21:10  @alice  reading about typed effects https://example.org/effects
```

`--max-following all` reads the whole following list (paged until it ends); protected accounts are skipped with a note, and `--per-author` caps what each author shows so quieter accounts are not pushed out:

```powershell
xc timeline --following carol --max-following all --per-author 1
```

```text
xc: home timeline of @carol from 4 followed accounts
xc: skipped @dave: Sorry, you are not authorized to see the posts of @dave.
2026-10-15 15:00  @erin  the whole thread
2026-10-15 14:00  @carol  worth reading
2026-10-15 13:10  @bob  agreed, ramen wins
2026-10-15 12:30  @alice  lunch: ramen
```

An account that follows nobody gets a home timeline of its own posts:

```powershell
xc timeline --following loner --max-following all
```

```text
xc: home timeline of @loner from 0 followed accounts
2026-10-15 10:00  @loner  nobody to follow yet
```

### Filters that lower the bill

`--since` and `--until` become the API's `start_time` and `end_time`:

```powershell
xc timeline --since 2026-10-15T12:00:00Z --until 2026-10-15T13:06:00Z bob
```

```text
2026-10-15 13:05  @bob  RT @alice: lunch: ramen
2026-10-15 12:30  @bob  same minute as alice, newer id
```

`--originals` (or `--no-replies`, `--no-reposts`) keeps the authors' own text; `--hints` adds media descriptions and link titles:

```powershell
xc timeline --originals --hints alice bob
```

```text
2026-10-15 12:30  @bob  same minute as alice, newer id
2026-10-15 12:30  @alice  lunch: ramen
2026-10-15 09:45  @bob  shipped v2 release notes soon
  [photo] release dashboard
2026-10-15 08:00  @alice  morning run done
2026-10-14 21:10  @alice  reading about typed effects https://example.org/effects
  [link] Typed effects, explained
```

### Reference trees

`--depth` follows quotes, replies and reposts down to three levels; each level past the first is one lookup of those posts, and unknown authors are named with one more lookup:

```powershell
xc timeline --depth 3 --limit 1 erin
```

```text
2026-10-15 15:00  @erin  the whole thread
  > quoted @carol: worth reading
    > quoted @bob: agreed, ramen wins
      > replying to @alice: lunch: ramen
```

With any depth, a repost shows its original once, in full, instead of the truncated `RT @...` text:

```powershell
xc timeline --depth 1 --limit 2 bob
```

```text
2026-10-15 13:10  @bob  agreed, ramen wins
  > replying to @alice: lunch: ramen
2026-10-15 13:05  @bob  reposted @alice: lunch: ramen
```

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
xc: stopped early, showing what was read before: X API answered 429 for /2/users/107/tweets?max_results=5&post.fields=created_at,author_id,entities,attachments: Too Many Requests
2026-10-15 12:30  @alice  lunch: ramen
2026-10-15 11:00  @mixed  reading what i can
2026-10-15 08:00  @alice  morning run done
2026-10-14 21:10  @alice  reading about typed effects https://example.org/effects
4
```

### Posting and deleting

With an OAuth 2.0 user token (`X_USER_TOKEN`):

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
$env:X_USER_TOKEN = $null; $env:X_CONSUMER_KEY = 'e2e-consumer-key'; $env:X_CONSUMER_SECRET = 'e2e-consumer-secret'; $env:X_OAUTH1_ACCESS_TOKEN = '110-e2e-access-token'; $env:X_OAUTH1_ACCESS_TOKEN_SECRET = 'e2e-access-token-secret'; xc post "signed: 100% & done"; xc delete 9002
```

```text
posted 9002
deleted 9002
```

A wrong secret makes the signature invalid:

```powershell
$env:X_USER_TOKEN = $null; $env:X_CONSUMER_KEY = 'e2e-consumer-key'; $env:X_CONSUMER_SECRET = 'not-the-secret'; $env:X_OAUTH1_ACCESS_TOKEN = '110-e2e-access-token'; $env:X_OAUTH1_ACCESS_TOKEN_SECRET = 'e2e-access-token-secret'; xc post "forged"; $LASTEXITCODE
```

```text
xc: X API answered 401 for /2/tweets: Unauthorized
4
```

The app-only token cannot post; the API's own refusal is shown:

```powershell
$env:X_USER_TOKEN = $env:X_BEARER_TOKEN; xc post "with the app token"; $LASTEXITCODE
```

```text
xc: X API answered 403 for /2/tweets: Unsupported Authentication: Authenticating with OAuth 2.0 Application-Only is forbidden for this endpoint.  Supported authentication types are [OAuth 1.0a User Context, OAuth 2.0 User Context].
4
```

```powershell
$env:X_USER_TOKEN = $null; xc post "no user credentials"; $LASTEXITCODE
```

```text
xc: posting needs user credentials: X_CONSUMER_KEY, X_CONSUMER_SECRET, X_OAUTH1_ACCESS_TOKEN and
    X_OAUTH1_ACCESS_TOKEN_SECRET (OAuth 1.0a, never expire), or X_USER_TOKEN (OAuth 2.0, 2 hours)
3
```

### Errors and exit codes

```powershell
xc timeline broke; $LASTEXITCODE
```

```text
xc: X API answered 402 for /2/users/106/tweets?max_results=5&post.fields=created_at,author_id,entities,attachments: CreditsDepleted: Your enrolled account does not have any credits to fulfill this request.
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
usage: xc timeline [options] HANDLE...
       xc timeline [options] [--max-following N|all] --following HANDLE
       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_USER_TOKEN)
env:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)
       --per-account N   posts fetched per account, 5..100 (default 5)
       --limit N         timeline entries shown (default 20)
       --per-author N    entries shown per author (default all)
       --since DATE      posts at or after DATE (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ)
       --until DATE      posts before DATE
       --no-replies, --no-reposts, --originals (both)
       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)
       --hints           media and link titles under each post
       --max-following N accounts followed by HANDLE to include, or all (default 20)
2
```

## 4. What a run costs

Pay-per-use prices (docs.x.com, October 2026): $0.010 per user returned by a lookup, $0.010 per account returned by a following list, $0.005 per post returned, $0.015 per post created; a resource read again within the same UTC day is billed once.

| Run | Requests | Worst case |
| --- | --- | --- |
| `xc timeline a b` (defaults) | 1 lookup + 2 post reads | $0.02 + 10 posts = $0.07 |
| `xc timeline --following h` (cap 20) | 1 lookup + 1 following page + 21 post reads | $0.01 + $0.20 + 105 posts = $0.735 |
| `xc timeline --following h --max-following all` (500 follows) | 1 lookup + 1 following page + 501 post reads | $0.01 + $5.00 + 2,505 posts = $17.535 |

`--since`, `--until` and `--originals` lower the post term; `--per-author` and `--limit` only change what is shown. `--depth N` adds up to N-1 lookups of referenced posts and one user lookup.

## 5. Live samples

Captured from the real API on 2026-10-16 00:09 (UTC-4) with this build. NASA posts are US government works.

Hints show the photo descriptions NASA writes and the titles of linked pages:

```console
> xc timeline --limit 4 --hints NASA
2026-10-15 20:36  @NASA  @StCroixSkol 🙌
2026-10-15 20:03  @NASA  LIVE: Tune in as agency leaders and partners discuss NASA's contributions to @JAXA_en's Martian Moons eXploration (MMX) mission, scheduled to lift off on Monday, Oct. 19. https://youtu.be/3k2mpWrOD1s https://x.com/NASA/status/2110823965954637903/photo/1
  [photo] The blue NASA "meatball" insignia overlaid on top of a Martian background.
  [link] NASA's Role in the Martain Moons eXploration (MMX) Mission (October 15, 2026)
2026-10-15 19:30  @NASA  LIVE: Members of Crew-12 are at @NASAJohnson to discuss their mission aboard the @Space_Station and answer questions from the media. The crew spent 237 days living and working in orbit and returned to Earth on Thursday, Oct. 8. https://x.com/i/broadcasts/1qxvveyYAqWxB
  [link] NASA
2026-10-15 18:22  @NASA  Did you know we have a newsletter?  We send out weekly updates straight to your inbox about all that’s happening at NASA—free of charge. From space science to technology on the ground, never miss a NASA update: https://bit.ly/3TzoW6w https://x.com/NASA/status/2110798512795377741/photo/1
  [photo] A long-exposure photo of Earth taken from aboard the International Space Station. The nighttime view of Earth shows long streaks of city lights and a soft, green airglow outlining the planet. Blurry stars fill the background, and space station hardware appears in the foreground.
```

`--originals` dropped the reply above; `--per-author 2` lets a third account in:

```console
> xc timeline --originals --per-author 2 --limit 4 NASA NASAWebb NASAHubble
2026-10-15 20:03  @NASA  LIVE: Tune in as agency leaders and partners discuss NASA's contributions to @JAXA_en's Martian Moons eXploration (MMX) mission, scheduled to lift off on Monday, Oct. 19. https://youtu.be/3k2mpWrOD1s https://x.com/NASA/status/2110823965954637903/photo/1
2026-10-15 19:30  @NASA  LIVE: Members of Crew-12 are at @NASAJohnson to discuss their mission aboard the @Space_Station and answer questions from the media. The crew spent 237 days living and working in orbit and returned to Earth on Thursday, Oct. 8. https://x.com/i/broadcasts/1qxvveyYAqWxB
2026-10-15 16:57  @NASAHubble  @NASARoman Hubble can follow up on Roman's much wider views in greater detail, and in different types of light. Each telescope picks up complementary info!  You can think of Roman as a wide-angle camera viewing a broad landscape, and Hubble as a zoom lens in ultraviolet and visible light:
2026-10-15 16:57  @NASAHubble  Did you catch the @NASARoman launch? 🚀  NASA’s newest space telescope is on the way to its home orbit a million miles away, where it’ll capture wide-field, infrared views of the universe!  Roman gets the big picture, while Hubble delivers the details. ⬇️ https://x.com/NASAHubble/status/2110777091495010469/photo/1
```

Reposts show the original in full, quotes are followed:

```console
> xc timeline --depth 2 --limit 3 NASA_Astronauts
2025-06-20 15:03  @NASA_Astronauts  This account is now archived, but the mission continues. 🚀 For official updates about @NASA astronauts, follow @Space_Station 🛰️, @NASA_Johnson 🌍, and our individual astronaut accounts listed at http://nasa.gov/social-media. 👨‍🚀 👩‍🚀 https://x.com/NASA_Astronauts/status/1936077425344929970/photo/1
2025-06-20 14:23  @NASA_Astronauts  reposted @JonnyKimUSA: Caught a fish! Hope you enjoy this round of space fishing for beautiful auroras. If you’re wondering what the reflections in the lower left are, I made a rookie mistake of not having the shroud completely cover the window so you can see some crew activity (the cupola is located https://x.com/JonnyKimUSA/status/1936066582217642158/video/1
2025-06-18 19:16  @NASA_Astronauts  Lightning from Hurricane Erick, captured by @Astro_Ayers while orbiting Earth aboard the @Space_Station. 🌩 https://twitter.com/Astro_Vapor/status/1935415114402033715
  > quoted @Astro_Vapor: We flew over Hurricane Erick this morning (last night for those on Earth), and I caught some of the lightning in the storm. I shoot these at 120 frames per second, and this bolt of lightning stuck around for over 40 frames!   In these pictures, you can see the clear bolt outline, https://x.com/Astro_Ayers/status/1935415114402033715/photo/1
```

## 6. Possibilities

What you can build on `xc` today:

- **Watch accounts cheaply:** a scheduled `xc timeline --since <yesterday> --originals a b c` only pays for new original posts.
- **Read someone's home timeline** without their login: `--following h` rebuilds it from the accounts they follow (cap it; follows cost $0.010 each).
- **Follow conversations:** `--depth 3` shows what a post quotes, answers or reposts.
- **Post from scripts or CI:** `xc post` and `xc delete` with OAuth 1.0a keys that never expire, exit codes for every failure.
- **Run anywhere:** one static binary; credentials only from environment variables, so a Kubernetes secret maps onto it directly.

Where it is going (backlog items in i574n.github/docs/backlog):

- **Programs as threads** (X-CLIENT-THREADS): read a thread, expand its links, reassemble the Spiral source posted across it, compile and run it. Every top-level definition of `xc` itself already fits one 280-weight post (`edition: 3`), so its own source can travel this way.
- **The simulated world** (`apps/sim`): many users posting, editing, liking and breaking Spiral cells, with delayed and duplicated deliveries; the live client is its real-world counterpart.
- **Agents as users** (X-CLIENT-AGENT-JSON): machine-readable output so an agent can call `xc` as a tool.
- **Token refresh** (X-CLIENT-TOKEN-REFRESH) for OAuth 2.0 user tokens, and provenance of posted programs on NEAR (X-NEAR-PROVENANCE).

## 7. How it is built

Shared modules, compiled into every crate that opens them:

| Module | Role |
| --- | --- |
| `prelude.spi` | list and result helpers |
| `posts.spi` | posts, references, links and media; newest-first merge sort, per-author caps, reference trees and hints |
| `cli.spi` | arguments to a typed command (`ShowTimeline`, `PublishPost`, `RemovePost`) with filters and views; validators arrive as a `checks` record |
| `oauth1.spi` | OAuth 1.0a: RFC 3986 percent-encoding, the signature base string, HMAC-SHA1 (`hmac`, `sha1`, `base64` crates) |
| `wire.spi` | `reads r` and `writes r`, GADTs indexed by their reply, so a request determines its reply type; `api app_context` and `api user_context`, so a client built from the app token cannot write; JSON (`serde_json`) primitives; typed failures |
| `transport.spi` | requests through `xc_net`, reply classification, `id:handle` account lines |

Each entry is one Rust crate, so every generated file stays reviewable (`scripts/gate.ps1` reports generated lines against 1000). Crates exchange strings, numbers and tuples:

| Crate | Entry | Role |
| --- | --- | --- |
| `xc_net` | `net/net.spi` | HTTP (`ureq`), OAuth 1.0a headers, nonces and clock |
| `xc_checks` | `checks/checks.spi` | count, date and handle validators |
| `xc_args` | `args/args.spi` | process arguments to command fields, usage text |
| `xc_users` | `users/users.spi` | handle lookup, followed accounts with paging, lookup by id |
| `xc_fetch` | `fetch/fetch.spi` | each account's posts, with the ids they reference |
| `xc_refs` | `refs/refs.spi` | referenced posts, level by level up to `--depth` |
| `xc_write` | `write/write.spi` | posting and deleting with user credentials |
| `xc_view` | `view/view.spi` | rebuilds posts from the gathered replies, selects and renders them |
| `xc` | `xc/xc.spi` | entry: environment, credentials, the order of calls, exit codes, output |

Tests: the test blocks of `prelude`, `posts`, `cli`, `wire` and `transport` run on Zig; `oauth1`'s run on Rust (std only) and check the base string against X's published example; negative tests prove that a users lookup is not a posts read, a deletion does not reply with a created post, and the app token cannot write. The e2e replays this page against `e2e/stub.py`.
