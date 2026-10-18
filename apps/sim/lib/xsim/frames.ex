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

  defp posted_units(text) do
    text
    |> Xsim.XCompat.segments()
    |> Enum.flat_map(fn
      {:link, link} -> [{link, Xsim.XCompat.shortened_url_weight()}]
      {:text, plain} -> plain |> String.graphemes() |> Enum.map(&{&1, weight(&1)})
    end)
  end

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

  def rebuild(frames), do: frames |> Enum.sort_by(&elem(&1, 0)) |> Enum.map_join(&elem(&1, 2))

  def explode_posts(events, limit \\ @limit) do
    Enum.flat_map(events, fn
      {:post, id, parent, source} -> for {k, n, body} <- split(id, source, limit), do: {:frame, id, parent, k, n, body}
      other -> [other]
    end)
  end
end
