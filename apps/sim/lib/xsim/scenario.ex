defmodule Xsim.Scenario do
  defstruct seed: 1, posts: [], events: [], broken: MapSet.new()

  @type event ::
          {:post, String.t(), String.t() | nil, String.t()}
          | {:edit, String.t(), String.t()}
          | {:like, String.t(), String.t()}
          | {:unlike, String.t(), String.t()}
          | {:delete, String.t()}

  def from_corpus(threads, opts \\ []), do: drawn(:corpus_raw, threads |> Enum.map(&Enum.join(&1, <<0>>)) |> Enum.join(<<1>>), opts)

  def from_cells(cells, opts \\ []), do: drawn(:cells_raw, Enum.join(cells, <<0>>), opts)

  defp drawn(fun, text, opts) do
    settings = [opts[:seed] || 1, opts[:users] || 8, opts[:edits] || 3, opts[:breaking] || 0, opts[:churn] || 0, personas_text(opts[:personas] || [])]
    {stream, broken} = Xsim.Spiral.call(fun, [text | settings] ++ [false, 1, 100])
    events = stream |> Xsim.Log.decode() |> Enum.map(&elem(&1, 1))
    posts = Enum.filter(events, &match?({:post, _, _, _}, &1))
    %__MODULE__{seed: opts[:seed] || 1, posts: posts, events: events, broken: broken |> String.split(<<0>>, trim: true) |> MapSet.new()}
  end

  defp personas_text(personas), do: Enum.map_join(personas, "+", &"#{&1}=1")

  def break_source(source), do: Xsim.Spiral.call(:break_source, [source])

  def deliveries(%__MODULE__{events: events}, opts \\ []) do
    text = Xsim.Log.encode(Enum.with_index(events, fn event, i -> {i, event} end))
    permille = round(Keyword.get(opts, :duplicates, 0.1) * 1000)
    Xsim.Spiral.call(:rescheduled, [text, Keyword.get(opts, :schedule_seed, 1), permille, Keyword.get(opts, :window, 6)]) |> Xsim.Log.decode()
  end
end
