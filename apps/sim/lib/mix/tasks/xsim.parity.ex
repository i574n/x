defmodule Mix.Tasks.Xsim.Parity do
  use Mix.Task

  @shortdoc "Writes what the Elixir World, Runner and Invariants make of a recorded event stream, one labelled line per expectation, for the Spiral parity tests"

  @impl Mix.Task
  def run(args) do
    Mix.Task.run("app.start")
    {opts, _} = OptionParser.parse!(args, strict: [events: :string, out: :string])
    deliveries = (opts[:events] || Mix.raise("missing --events")) |> File.read!() |> Xsim.Log.decode()
    out = opts[:out] || Mix.raise("missing --out")
    world = Enum.reduce(deliveries, Xsim.World.new(), &Xsim.World.apply_delivery(&2, &1))
    state = Xsim.Runner.run(deliveries, Xsim.Executors.fake())
    wanted = Xsim.World.wanted(world)
    wrong = fn _ -> %{status: :ok, out: "other"} end

    lines = [
      {"tallies", "framed=#{world.framed} edits=#{world.framed_edits} dups=#{world.duplicates} buffered=#{world.buffered}"},
      {"keys", pairs(world.keys, & &1)},
      {"wanted", pairs(wanted, & &1)},
      {"wanted_count", "#{map_size(wanted)}"},
      {"visible", pairs(state.visible, fn {key, r} -> "#{key}:#{r.out}" end)},
      {"visible_count", "#{map_size(state.visible)}"},
      {"checks_fake", findings(state, Xsim.Executors.fake())},
      {"checks_wrong", findings(state, wrong)}
    ]

    File.write!(out, Enum.map_join(lines, "", fn {label, value} -> "#{label} #{value}\n" end))
    IO.puts("xsim.parity deliveries=#{length(deliveries)} posts=#{map_size(world.keys)} visible=#{map_size(state.visible)}")
  end

  defp pairs(map, f), do: map |> Map.keys() |> Enum.sort() |> Enum.map_join(";", &"#{&1}=#{f.(map[&1])}")

  defp findings(state, baseline) do
    state
    |> Xsim.Invariants.check(baseline)
    |> Enum.map_join(" ", fn
      {rule, :ok} -> "#{rule}=ok"
      {rule, {:violations, ids}} -> "#{rule}=FAIL[#{Enum.join(ids, ",")}]"
    end)
  end
end
