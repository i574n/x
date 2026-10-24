defmodule Xsim.Json do
  @opened_levels 4

  def json(value), do: json(value, 0)

  defp json(map, level) when is_map(map) do
    pairs = for {k, v} <- Enum.sort_by(map, fn {k, _} -> to_string(k) end), do: JSON.encode!(to_string(k)) <> ": " <> json(v, level + 1)
    laid_out(pairs, "{", "}", level)
  end

  defp json(list, level) when is_list(list), do: laid_out(Enum.map(list, &json(&1, level + 1)), "[", "]", level)
  defp json(value, _level), do: JSON.encode!(value)

  defp laid_out([], open, close, _level), do: open <> close

  defp laid_out(items, open, close, level) when level < @opened_levels do
    inner = String.duplicate("    ", level + 1)
    open <> "\n" <> inner <> Enum.join(items, ",\n" <> inner) <> "\n" <> String.duplicate("    ", level) <> close
  end

  defp laid_out(items, open, close, _level), do: open <> Enum.join(items, ", ") <> close
end
