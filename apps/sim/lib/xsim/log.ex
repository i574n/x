defmodule Xsim.Log do
  @format "xsim-events"
  @version 1
  @fields %{
    post: [:post, :parent, :source],
    frame: [:post, :parent, :k, :n, :body],
    edit: [:post, :source],
    edit_frame: [:post, :rev, :k, :n, :body],
    delete: [:post],
    like: [:post, :user],
    unlike: [:post, :user]
  }

  def write(path, deliveries), do: File.write!(path, encode(deliveries))

  def encode(deliveries) do
    lines = [compact(%{format: @format, version: @version}) | Enum.map(deliveries, &delivery_line/1)]
    Enum.join(lines, "\n") <> "\n"
  end

  def read(path), do: path |> File.read!() |> decode()

  def decode(text) do
    text
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(&JSON.decode!/1)
    |> events()
  end

  defp events([%{"format" => @format, "version" => @version} | lines]), do: Enum.map(lines, &delivery/1)
  defp events([%{"format" => format, "version" => version} | _]), do: raise(ArgumentError, "unsupported event stream #{format} v#{version}, expected #{@format} v#{@version}")
  defp events(legacy), do: Enum.map(legacy, &positional/1)

  defp delivery_line({index, event}) do
    [kind | values] = Tuple.to_list(event)
    @fields |> Map.fetch!(kind) |> Enum.zip(values) |> Map.new() |> Map.merge(%{at: index, kind: Atom.to_string(kind)}) |> compact()
  end

  defp delivery(%{"at" => index, "kind" => kind} = line) do
    kind = String.to_existing_atom(kind)
    values = for field <- Map.fetch!(@fields, kind), do: Map.fetch!(line, Atom.to_string(field))
    {index, List.to_tuple([kind | values])}
  end

  defp positional([index, kind | fields]), do: {index, List.to_tuple([String.to_existing_atom(kind) | fields])}

  def compact(map) when is_map(map) do
    pairs = for {k, v} <- Enum.sort_by(map, fn {k, _} -> to_string(k) end), do: JSON.encode!(to_string(k)) <> ":" <> compact(v)
    "{" <> Enum.join(pairs, ",") <> "}"
  end

  def compact(value), do: JSON.encode!(value)
end
