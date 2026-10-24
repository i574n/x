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
    Xsim.Personas.parse(opts[:personas])
    staging = [cells, opts[:seed] || 1, opts[:users] || 3, opts[:edits] || 1, opts[:personas] || "", round((opts[:duplicates] || 0.2) * 1000), opts[:frames] || false]
    stream = apply(Xsim.Spiral, :scenario_stream, staging)
    File.write!(opts[:out] || Mix.raise("missing --out"), stream)
    File.write!(opts[:expected] || Mix.raise("missing --expected"), apply(Xsim.Spiral, :scenario_final, staging))
    IO.puts("xsim.events #{Path.basename(spi)} deliveries=#{length(Xsim.Log.decode(stream))}")
  end
end
