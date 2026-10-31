defmodule Mix.Tasks.Xsim.Parity do
  use Mix.Task

  @shortdoc "Writes what the Elixir World, Runner and Invariants make of a recorded event stream as JSON, for the Spiral parity tests"

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

    report = %{
      "tallies" => %{"framed" => world.framed, "edits" => world.framed_edits, "dups" => world.duplicates, "buffered" => world.buffered},
      "keys" => strings(world.keys, & &1),
      "wanted" => strings(wanted, & &1),
      "visible" => strings(state.visible, fn {key, r} -> %{"key" => key, "out" => r.out} end),
      "checks_fake" => findings(state, Xsim.Executors.fake()),
      "checks_wrong" => findings(state, wrong)
    }

    File.write!(out, Xsim.Json.json(report) <> "\n")
    IO.puts("xsim.parity deliveries=#{length(deliveries)} posts=#{map_size(world.keys)} visible=#{map_size(state.visible)}")
  end

  defp strings(map, f), do: Map.new(map, fn {k, v} -> {to_string(k), f.(v)} end)

  defp findings(state, baseline) do
    Map.new(Xsim.Invariants.check(state, baseline), fn
      {rule, :ok} -> {to_string(rule), "ok"}
      {rule, {:violations, ids}} -> {to_string(rule), ids}
    end)
  end
end
