defmodule Mix.Tasks.Xsim.ThreadRun do
  use Mix.Task

  @shortdoc "Run the program a thread carries under Cells and compare every test verdict with the original file"

  @impl Mix.Task
  def run(args) do
    Mix.Task.run("app.start")
    {opts, _} = OptionParser.parse!(args, strict: [file: :string, program: :string, expected: :string])
    file = Path.expand(opts[:file] || Mix.raise("missing --file"))
    original = File.read!(file)
    program = program_text(opts)
    same_cells = sources(program) == sources(original)
    want = verdicts(original, file)
    got = verdicts(program, file)
    differing = for {w, g} <- Enum.zip(want.tests, got.tests), w != g, do: {w, g}
    agree = same_cells and want == got and want.tests != []

    IO.puts("XSIM thread_run file=#{Path.basename(file)} cells=#{length(sources(program))} tests=#{length(got.tests)} same_cells=#{same_cells} status=#{got.status}/#{want.status} result=#{if agree, do: "pass", else: "fail"}")
    for {w, g} <- differing, do: IO.puts("  file=#{inspect(w)}\n  thread=#{inspect(g)}")
    unless agree, do: exit({:shutdown, 1})
  end

  defp program_text(opts) do
    cond do
      opts[:program] -> File.read!(opts[:program])
      opts[:expected] -> (opts[:expected] |> File.read!() |> JSON.decode!() |> Map.fetch!("program") |> Enum.join("\n")) <> "\n"
      true -> Mix.raise("missing --program (xc thread output) or --expected (a thread-*.expected.json)")
    end
  end

  defp sources(text), do: for(%{kind: :spiral, source: source} <- Spiral.Cells.Document.parse_spi(text, "").cells, do: source)

  defp verdicts(text, file) do
    doc = Spiral.Cells.Document.parse_spi(text, "")
    result = Spiral.Cells.Notebook.evaluate(doc, path: file, root: Path.dirname(file), plan: :tests, spi: false, memo: false)
    %{status: status_of(result.status), tests: Enum.map(result.report["tests"], &row/1)}
  end

  defp row(test), do: {test["name"], test["status"], Enum.map(test["targets"], &{&1["target"], &1["status"]})}

  defp status_of(:ok), do: :ok
  defp status_of(_), do: :error
end
