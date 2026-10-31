# x

[![깃허브 코드스페이스](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=1421538869)

Typed apps for X, built on a sibling clone of [spiral](https://github.com/i574n/spiral) (`scripts/init.ps1` clones it beside this repo).

| Path | What it is |
|---|---|
| `apps/client` | `xc`, the X client: timelines, threads, post and delete, OAuth refresh, `--json`; Spiral modules that also run as Cells notebooks, compiled to one Rust crate per entry ([README](apps/client/README.md), whose walkthrough the e2e suite replays) |
| `apps/sim` | `xsim`, a seeded X-like event simulator that battle-tests Cells: Elixir supervision over the Spiral bulk (scenario, frames, invariants, world) compiled to Gleam |
| `postability` | the X postability profile (post weight limit, code point weights, link rules, TLD list, posting header budget) for tooling that checks whether a source posts one definition per post |
| `scripts` | `init.ps1` (clone spiral beside), `build.ps1` (every check CI runs), `workflow.ps1` (init + build, the CI entry), `gate.ps1` (1,000-line limit for every file but Spiral sources, generated Rust and Gleam included, data files exempt only by name; `-Compiler <SpiralCompiler.dll>` regenerates every crate with a candidate compiler and reports any that would change or grow past the gate), `actions-lock.ps1` (workflow actions match `.github/workflows/actions.lock`), `gleam-modules.ps1` (splits a generated Gleam file into modules of at most 1,000 lines: types, call-graph-ordered parts, and the entry's exports in the top module), `publish.ps1` (renders the repository tree page through spiral's `publish-tree.ps1`), `common.ps1` (dot-sourced by the others: repo and spiral roots, the spiral-beside check, target dirs, and the Cells notebook runner `Invoke-SpiralTests`, which names a local zig that differs from `ci.yml`'s pin) |

```powershell
pwsh scripts/workflow.ps1        # what CI runs
pwsh scripts/build.ps1 -fast 1   # local rebuild without the Cells notebooks and the real-Cells sim runs
pwsh apps/sim/build.ps1 -Ladder 6:8:3,10:8:4   # real-Cells scale ladder, notebooks:cells:concurrency per rung; run alone as a heavy eoie job
```

## Starting another Spiral repo from x

- Copy `scripts/` as is; only `build.ps1` names the apps. `init.ps1` clones spiral beside the repo from the same owner as the repo's remote, unpinned: a red run after a spiral change is fixed in spiral, then CI is rerun.
- Copy `.github/workflows/ci.yml` with its `actions.lock`. Any new or bumped `uses:` needs `gh actions-lock` in the same commit (GitHub fails the run at startup otherwise; `scripts/actions-lock.ps1` catches it locally).
- Copy the root `Cargo.toml` (workspace over `apps/<app>/*`), `rust-toolchain.toml`, `.cargo/config.toml` (static CRT on Windows), `.gitattributes` (LF everywhere, `Cargo.lock merge=ours`) and `.gitignore` (`target/`, `_build/`, `dist/`).
- Give each Spiral package a `spiral.toml` with `edition = 3` and `packageDir = '../../../spiral/lib'`, and each Rust entry its own `apps/<app>/<crate>/Cargo.toml` with `[package.metadata.spiral]` `entry`/`output`; `apps/client/build.ps1` shows the build loop that reads them.
