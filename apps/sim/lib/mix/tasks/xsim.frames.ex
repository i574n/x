defmodule Mix.Tasks.Xsim.Frames do
  use Mix.Task

  @shortdoc "Write the posts a thread writer must create for a file: cells at a blank line before a column-0 line, CELL k/n frames within 280 X weight, as X stores them, plus the program a reader rebuilds from them"

  @impl Mix.Task
  def run(args) do
    {opts, _} = OptionParser.parse!(args, strict: [file: :string, out: :string])
    file = opts[:file] || Mix.raise("missing --file")
    text = File.read!(file)
    posts = Xsim.Frames.thread_posts(text)
    program = text |> Xsim.Frames.file_cells() |> Enum.map(&:unicode.characters_to_nfc_binary/1) |> Enum.join("\n\n")
    lines = if program == "", do: [], else: String.split(program, "\n")
    File.write!(opts[:out] || Mix.raise("missing --out"), Xsim.XWorld.json(%{posts: posts, program: lines}) <> "\n")
    IO.puts("xsim.frames #{Path.basename(file)} cells=#{length(Xsim.Frames.file_cells(File.read!(file)))} posts=#{length(posts)}")
  end
end
