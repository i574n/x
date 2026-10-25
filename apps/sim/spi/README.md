# apps/sim/spi

The simulator in Spiral: the port of `lib/xsim`, one module per piece, over the client's shared modules (`prelude`, `events`, `invariants`, `splitter` and the scenario ones), which this package imports through `../../client`. `build.ps1` in `apps/sim` runs their tests.

| Module | What it holds |
| --- | --- |
| `inbox.spi` | the runner's inbox over an event stream: frames rebuilt into posts in any order, duplicates counted once, a child waiting for its parent, an edit re-keying its subtree, an older unlike never undoing a newer like |
| `scheduler.spi` | the runner core: demand from likes, one task per source prefix, withdrawn demand cancelled, eviction and recompute, crashes as visible results; `sync_run` settles a delivery list |
| `runner_checks.spi` | `invariants`' rules over a run against a baseline executor, commuting runs, and saved streams that replay to the same visible results |
| `scenario_checks.spi` | whole scenarios (shuffled and duplicated deliveries, frames, edits, churn, personas) through the runner, keeping every invariant |
| `tree_memory.spi` | the daemon-memory reading: `procs mb` samples folded into a peak, incrementally, and the Cells daemon's hello |
| `sim_report.spi` | the `XSIM` summary line in the Elixir field order, and the commute verdict |
| `sim_args.spi` | the options of `xsim run`, `events` and `world`, parsed like the mix tasks, with bad options named |
| `sim_run.spi` | a corpus cast into a scenario, schedules run one by one, one line per schedule plus the verdict |
| `executors.spi` | the fake executor and the leaking one, an actor that hands back the previous digest |
| `cells_executor.spi` | the Cells executor: a document of Spiral cells evaluated by `Spiral.Cells.Notebook`, through lib `erlang_term` |
| `runner_guard.spi` | a guard process per task, which kills it on cancel and reports crashes and timeouts |
| `runner_shell.spi` | the OTP runner shell (lib `otp_actor`): deliveries in, guarded tasks, cancellation and pacing; it settles like `sync_run` |
| `memory_watch.spi` | an actor that samples a process tree on a timer and answers peak calls |
| `xsim_shell_entry.spi` | `xsim-shell --replay STREAM [--max-concurrency N]`: a stream settled through the shell |
