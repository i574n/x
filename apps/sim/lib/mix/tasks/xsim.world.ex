defmodule Mix.Tasks.Xsim.World do
  use Mix.Task

  @shortdoc "Write the X state a seeded scenario leaves (framed posts, edit versions, replies, likes, posted from --base-time) as a stub world, plus the program a thread reader must rebuild"

  @impl Mix.Task
  def run(args) do
    Mix.Task.run("app.start")

    {opts, _} =
      OptionParser.parse!(args,
        strict: [spi: :string, out: :string, expected: :string, id_base: :integer, user_id: :string, username: :string, seed: :integer, edits: :integer, personas: :string, lost: :integer, lost_cells: :integer, cells: :integer, base_time: :string]
      )

    spi = opts[:spi] || Mix.raise("missing --spi")
    doc = Spiral.Cells.Document.parse_spi(File.read!(spi), "")
    cells = for %{kind: :spiral, source: source} <- doc.cells, do: source
    cells = if opts[:cells], do: Enum.take(cells, opts[:cells]), else: cells
    Xsim.Personas.parse(opts[:personas])
    {world, expected} = Xsim.Spiral.world_files(cells, opts)
    File.write!(opts[:out] || Mix.raise("missing --out"), world)
    File.write!(opts[:expected] || Mix.raise("missing --expected"), expected)
    IO.puts("xsim.world #{Path.basename(spi)} cells=#{length(cells)} bytes=#{byte_size(world)}")
  end
end
