defmodule Xsim.Frames do
  @limit 280

  defdelegate weight(text), to: Spiral.Cells.XCompat

  def header(id, k, n), do: "#{id} #{k}/#{n}\n"

  def split(id, source, limit \\ @limit) do
    chunks = spiral(:split_cell, [id, limit, source])
    n = length(chunks)
    chunks |> Enum.with_index(1) |> Enum.map(fn {body, k} -> {k, n, body} end)
  end

  @defused_dot "\u200B."

  def restored(text), do: text |> String.replace(@defused_dot, ".") |> String.replace(~r/([@#$])\x{200B}/u, "\\1")

  def frame_text(id, {k, n, body}), do: header(id, k, n) <> body

  def stored(text), do: String.trim_trailing(text)

  def file_cells(text), do: spiral(:file_cells, [text])

  def thread_posts(text), do: spiral(:thread_posts, [text])

  def rebuild(frames), do: frames |> Enum.sort_by(&elem(&1, 0)) |> Enum.map_join(&elem(&1, 2)) |> restored()

  def explode_posts(events, limit \\ @limit) do
    {exploded, _} =
      Enum.flat_map_reduce(events, %{}, fn
        {:post, id, parent, source}, revs ->
          {for({k, n, body} <- framed(id, source, limit), do: {:frame, id, parent, k, n, body}), revs}

        {:edit, id, source}, revs ->
          rev = Map.get(revs, id, 0) + 1
          {for({k, n, body} <- framed(id, source, limit), do: {:edit_frame, id, rev, k, n, body}), Map.put(revs, id, rev)}

        other, revs ->
          {[other], revs}
      end)

    exploded
  end

  defp framed(id, source, limit) do
    case split(id, source, limit) do
      [] -> [{1, 1, ""}]
      frames -> frames
    end
  end

  defp spiral(fun, args), do: :xsim_split |> Xsim.Spiral.call(fun, args) |> Xsim.Spiral.listed()
end
