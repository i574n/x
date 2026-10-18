defmodule Xsim.Frames do
  @limit 280

  defdelegate weight(text), to: Spiral.Cells.XCompat

  def header(id, k, n), do: "#{id} #{k}/#{n}\n"

  @word_cut_reach 60

  def split(id, source, limit \\ @limit) do
    text = :unicode.characters_to_nfc_binary(source)
    chunks = split_units(id, posted_units(text), limit, 99)
    n = length(chunks)
    chunks |> Enum.with_index(1) |> Enum.map(fn {body, k} -> {k, n, body} end)
  end

  defp split_units(id, units, limit, assumed_posts) do
    budget = limit - weight(header(id, assumed_posts, assumed_posts))
    chunks = chunk(units, budget, [], 0, [])
    posts = length(chunks)
    if digits(posts) > digits(assumed_posts), do: split_units(id, units, limit, posts), else: chunks
  end

  defp digits(n), do: n |> Integer.to_string() |> String.length()

  @defused_dot "\u200B."

  defp posted_units(text) do
    glyphs = String.graphemes(text)
    Enum.zip_with([[nil | glyphs], glyphs, tl(glyphs ++ [nil])], fn [prev, glyph, next] -> posted_unit(prev, glyph, next) end)
  end

  defp posted_unit(prev, ".", next) when is_binary(prev) and is_binary(next) do
    if prev =~ ~r/^[A-Za-z0-9_-]$/ and next =~ ~r/^[A-Za-z]$/, do: {@defused_dot, weight(@defused_dot)}, else: {".", 1}
  end

  defp posted_unit(_prev, glyph, _next), do: {glyph, weight(glyph)}

  def restored(text), do: String.replace(text, @defused_dot, ".")

  defp chunk([], _budget, current, _used, acc), do: Enum.reverse(flush(current, acc))

  defp chunk([{_, w} = unit | rest], budget, current, used, acc) do
    if used + w > budget and current != [] do
      {carried, kept} = cut_at_word_boundary(current)
      chunk(Enum.reverse(carried) ++ [unit | rest], budget, [], 0, flush(kept, acc))
    else
      chunk(rest, budget, [unit | current], used + w, acc)
    end
  end

  defp cut_at_word_boundary(current) do
    {word, rest} = Enum.split_while(current, fn {text, _} -> not whitespace?(text) end)
    {space, kept} = Enum.split_while(rest, fn {text, _} -> whitespace?(text) end)
    if kept != [] and length(word) + length(space) <= @word_cut_reach, do: {word ++ space, kept}, else: space_carried(current)
  end

  defp space_carried(current) do
    {space, kept} = Enum.split_while(current, fn {text, _} -> whitespace?(text) end)
    if kept != [], do: {space, kept}, else: {[], current}
  end

  defp whitespace?(text), do: String.trim(text) == ""

  defp flush([], acc), do: acc
  defp flush(current, acc), do: [current |> Enum.reverse() |> Enum.map_join(&elem(&1, 0)) | acc]

  def frame_text(id, {k, n, body}), do: header(id, k, n) <> body

  def stored(text), do: String.trim_trailing(text)

  @cell_boundary ~r/(?<=[^\n])\n\n(?=\n*[^ \t\n])/

  def file_cells(text) do
    case text |> String.replace("\r\n", "\n") |> String.replace_suffix("\n", "") do
      "" -> []
      plain -> plain |> String.split(@cell_boundary) |> Enum.map(&String.trim_trailing/1)
    end
  end

  def thread_posts(text) do
    for {cell, i} <- text |> file_cells() |> Enum.with_index(1), id = "c#{i}", frame <- frames_or_empty(split(id, cell)), do: stored(frame_text(id, frame))
  end

  defp frames_or_empty([]), do: [{1, 1, ""}]
  defp frames_or_empty(frames), do: frames

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
end
