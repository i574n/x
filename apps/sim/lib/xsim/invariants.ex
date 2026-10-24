defmodule Xsim.Invariants do
  alias Xsim.World

  @rules %{
    "sequential_equivalence" => :sequential_equivalence,
    "no_stale_results" => :no_stale_results,
    "one_compile_per_prefix" => :one_compile_per_prefix,
    "withdrawn_demand_hidden" => :withdrawn_demand_hidden,
    "unwanted_results_freed" => :unwanted_results_freed
  }

  def check(state, baseline) do
    wanted = World.wanted(state.world)
    rows = visible_rows(state, wanted, baseline) ++ demand_rows(state, wanted)
    :checked_text |> Xsim.Spiral.call([Enum.join(rows, "\n")]) |> verdicts()
  end

  def breaking_edits_fail(state, broken) do
    marked = for {id, _} <- state.visible, post = state.world.posts[id], MapSet.member?(broken, World.current_source(post)), do: row(%{row: "broken", id: id})
    :breaking_text |> Xsim.Spiral.call([Enum.join(visible_rows(state, %{}, nil) ++ marked, "\n")]) |> verdict()
  end

  def commute(a, b), do: :commute_text |> Xsim.Spiral.call([snapshot(a), snapshot(b)]) |> verdict()

  def comparable(%{status: status, out: out}), do: {status, Xsim.Spiral.call(:masked_text, [out])}
  def comparable(other), do: other

  defp snapshot(state), do: state |> visible_rows(%{}, nil) |> Enum.join("\n")

  defp visible_rows(state, wanted, baseline) do
    for {id, {key, result}} <- state.visible do
      based = if baseline && wanted[id] == key, do: Map.merge(%{based: 1}, outcome("base_", baseline.(World.sources(state.world, id)))), else: %{based: 0}
      row(%{row: "visible", id: id, key: key} |> Map.merge(outcome("", result)) |> Map.merge(based))
    end
  end

  defp demand_rows(state, wanted) do
    tallies = for {kind, counts} <- [start: state.starts, cancelled: state.cancelled, evicted: state.evicted], {key, n} <- counts, do: row(%{row: kind, key: key, count: n})
    evicting = if state.evicting, do: [row(%{row: "evicting"})], else: []
    for({id, key} <- wanted, do: row(%{row: "wanted", id: id, key: key})) ++ tallies ++ for({key, _} <- state.results, do: row(%{row: "result", key: key})) ++ evicting
  end

  defp outcome(prefix, %{status: status, out: out}), do: %{"#{prefix}ok": if(status == :ok, do: 1, else: 0), "#{prefix}out": "#{status}|#{out}"}
  defp outcome(prefix, other), do: %{"#{prefix}ok": 0, "#{prefix}out": inspect(other)}

  defp row(map), do: Xsim.Log.compact(map)

  defp verdicts(text) do
    for pair <- String.split(text, " ", trim: true), [name, value] = String.split(pair, "=", parts: 2), do: {Map.fetch!(@rules, name), verdict(value)}
  end

  defp verdict("ok"), do: :ok
  defp verdict("FAIL[" <> rest), do: {:violations, rest |> String.trim_trailing("]") |> String.split(",", trim: true)}
end
