defmodule Mix.Tasks.Xsim.Events do
  use Mix.Task

  @shortdoc "Write a seeded scenario's delivery stream (xsim-events v1, shuffled and duplicated) and the final state every replay must reach"

  @impl Mix.Task
  def run(args) do
    Mix.Task.run("app.start")

    {opts, _} =
      OptionParser.parse!(args,
        strict: [spi: :string, cells: :integer, seed: :integer, users: :integer, edits: :integer, personas: :string, duplicates: :float, frames: :boolean, out: :string, expected: :string]
      )

    spi = opts[:spi] || Mix.raise("missing --spi")
    doc = Spiral.Cells.Document.parse_spi(File.read!(spi), "")
    cells = for %{kind: :spiral, source: source} <- doc.cells, do: source
    cells = if opts[:cells], do: Enum.take(cells, opts[:cells]), else: cells
    scenario = Xsim.Scenario.from_cells(cells, seed: opts[:seed] || 1, users: opts[:users] || 3, edits: opts[:edits] || 1, personas: Xsim.Personas.parse(opts[:personas]))
    {live, likes} = Xsim.XWorld.final_cells(scenario.events)
    streamed = if opts[:frames], do: %{scenario | events: Xsim.Frames.explode_posts(scenario.events)}, else: scenario
    deliveries = Xsim.Scenario.deliveries(streamed, schedule_seed: 1, duplicates: opts[:duplicates] || 0.2)
    Xsim.Log.write(opts[:out] || Mix.raise("missing --out"), deliveries)
    final = %{cells: for(c <- live, do: %{post: c.id, parent: c.parent, source: List.last(c.revisions)}), likes: likes}
    File.write!(opts[:expected] || Mix.raise("missing --expected"), Xsim.XWorld.json(final) <> "\n")
    IO.puts("xsim.events #{Path.basename(spi)} events=#{length(streamed.events)} deliveries=#{length(deliveries)} live=#{length(live)}")
  end
end
