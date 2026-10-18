defmodule Mix.Tasks.Xsim.World do
  use Mix.Task

  @shortdoc "Write the X state a seeded scenario leaves (framed posts, edit versions, replies, likes, posted from --base-time) as a stub world, plus the program a thread reader must rebuild"

  @impl Mix.Task
  def run(args) do
    Mix.Task.run("app.start")

    {opts, _} =
      OptionParser.parse!(args,
        strict: [spi: :string, out: :string, expected: :string, id_base: :integer, user_id: :string, username: :string, seed: :integer, edits: :integer, personas: :string, lost: :integer, cells: :integer, base_time: :string]
      )

    spi = opts[:spi] || Mix.raise("missing --spi")
    doc = Spiral.Cells.Document.parse_spi(File.read!(spi), "")
    cells = for %{kind: :spiral, source: source} <- doc.cells, do: source
    cells = if opts[:cells], do: Enum.take(cells, opts[:cells]), else: cells
    scenario = Xsim.Scenario.from_cells(cells, seed: opts[:seed] || 1, edits: opts[:edits] || 0, personas: Xsim.Personas.parse(opts[:personas]))
    {live, likes} = Xsim.XWorld.final_cells(scenario.events)
    world = Xsim.XWorld.materialize(live, id_base: opts[:id_base] || 3_000_000, lost: opts[:lost] || 0)
    {:ok, base_time, _} = DateTime.from_iso8601(opts[:base_time] || "2026-10-18T08:00:00Z")
    username = opts[:username] || "spiralposts"
    user = %{id: opts[:user_id] || "500", name: username, username: username, posts: Xsim.XWorld.posts(world, likes, base_time)}
    File.write!(opts[:out] || Mix.raise("missing --out"), Xsim.XWorld.json(%{users: [user]}) <> "\n")
    program = Xsim.XWorld.program(live, world)
    lines = if program == "", do: [], else: String.split(program, "\n")
    expected = %{root: world.root, program: lines, incomplete: world.lost}
    File.write!(opts[:expected] || Mix.raise("missing --expected"), Xsim.XWorld.json(expected) <> "\n")
    IO.puts("xsim.world #{Path.basename(spi)} personas=#{inspect(Xsim.Personas.parse(opts[:personas]))} cells=#{length(live)} posts=#{length(user.posts)} root=#{world.root} lost=#{length(world.lost)}")
  end
end
