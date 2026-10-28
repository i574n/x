# apps/sim/spi

The simulator in Spiral: the port of `lib/xsim`, one module per piece, over the client's shared modules (`prelude`, `events`, `invariants`, `splitter` and the scenario ones), which this package imports through `../../client`. `build.ps1` in `apps/sim` runs their tests.

| Module | What it holds |
| --- | --- |
| `exsss.spi` | Erlang's `rand` exsss generator (splitmix64 seeding, xorshift116**, `uniform_s`) on `u64`, so Rust, Gleam and the BEAM simulator draw the same numbers from the same seed |
| `events.spi` | the simulator's event stream (xsim-events v1): an `event` union over content, revisions and reactions, its compact JSON encoder, and a decoder that reads a stream back byte for byte or says why it cannot |
| `final_state.spi` | the state every replay of a scenario must reach: live cells with their latest distinct revision, likes as distinct users per post, laid out as the simulator's JSON |
| `personas.spi` | the simulator's personas (lurker, fickle, editor, breaker) as a union, their seeded actions, and `break_source` (the last number of a test cell bumped) |
| `scenario.spi` | a file's cells to a seeded scenario: posts chained to their parents, likes, unlikes, edits, breaking edits, persona actions and churn woven in |
| `schedule.spi` | posts and edits exploded into `CELL k/n` frames, deliveries jittered and duplicated by a seeded schedule, and the whole stream as xsim-events v1 |
| `world.spi` | a scenario materialized as the X world the client e2e reads: framed posts with edit versions, replies, likes and timestamps from a base time, posts or whole cells lost on purpose, and the program a thread reader must rebuild |
| `invariants.spi` | the simulator's checks over a runner snapshot as a `rule` union with `Held` or `Broken` ids: sequential equivalence, no stale results, one compile per prefix, withdrawn demand hidden, unwanted results freed, and schedules that commute; run folders and thread numbers masked before comparing |
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

Two entries are Gleam packages instead of crates, each kept under the 1,000-line limit by its own build. `xsim_split/xsim_split.spi` (package `apps/sim/split`) exports the splitter (`split_cell`, `file_cells`, `thread_posts`) to the simulator, plus `split_cell_joined`, the chunks as one text joined with character 0, for the other package, since each Gleam package has its own list type. `simframes/simframes.spi` (package `apps/sim/frames`, which depends on `xsim_split`; still a Cells notebook, with a Gleam test of how threads and cells are separated) exports the scenario's event stream and final state (`scenario_stream`, `scenario_final`) and the e2e worlds (`world_files`). `schedule` and `world` take the splitter as a `cell_chunker` argument, so `simframes` passes the `xsim_split` call and the notebook tests pass `splitter`'s own. The simulator's Elixir side is now glue around that build: `Xsim.Frames` adapts the splitter, `Xsim.Scenario` draws scenarios and schedules deliveries through Spiral (the xsim-events stream is the interface), `Xsim.Invariants` hands the runner's state to Spiral's checks, and only the runner, the world it supervises and the executors stay Elixir. `apps/sim/test/spiral_test.exs` requires the Gleam build to write the simulator's event, final-state and world fixtures byte for byte.
