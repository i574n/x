defmodule Xsim.XWorld do
  defstruct ids: 0, clock: 0, frames: %{}, order: [], last_frame: %{}, root: nil, lost: []

  def final_cells(events) do
    Enum.reduce(events, {[], %{}, %{}}, fn
      {:post, id, parent, source}, {order, cells, likes} ->
        {order ++ [id], Map.put(cells, id, %{id: id, parent: parent, revisions: [source], deleted: false}), likes}

      {:edit, id, source}, {order, cells, likes} ->
        case cells do
          %{^id => %{revisions: revisions} = cell} when hd(revisions) != source ->
            {order, Map.put(cells, id, %{cell | revisions: [source | revisions]}), likes}

          _ ->
            {order, cells, likes}
        end

      {:delete, id}, {order, cells, likes} ->
        {order, Map.update(cells, id, nil, &%{&1 | deleted: true}), likes}

      {:like, id, user}, {order, cells, likes} ->
        {order, cells, Map.update(likes, id, MapSet.new([user]), &MapSet.put(&1, user))}

      {:unlike, id, user}, {order, cells, likes} ->
        {order, cells, Map.update(likes, id, MapSet.new(), &MapSet.delete(&1, user))}
    end)
    |> then(fn {order, cells, likes} ->
      live = for id <- order, cell = cells[id], not cell.deleted, do: %{cell | revisions: Enum.reverse(cell.revisions)}
      {live, Map.new(likes, fn {id, users} -> {id, MapSet.size(users)} end)}
    end)
  end

  def materialize(cells, opts) do
    base = Keyword.fetch!(opts, :id_base)
    world = Enum.reduce(cells, %__MODULE__{ids: base}, &post_cell/2)
    world = Enum.reduce(cells, world, &edit_cell/2)
    lose(world, cells, Keyword.get(opts, :lost, 0))
  end

  defp next_id(world), do: {Integer.to_string(world.ids + 1), %{world | ids: world.ids + 1, clock: world.clock + 1}}

  defp post_cell(cell, world) do
    [first | _] = cell.revisions
    parts = Xsim.Frames.split(cell.id, first)

    Enum.reduce(parts, world, fn {k, n, body}, world ->
      {id, world} = next_id(world)
      reply_to = if k == 1, do: Map.get(world.last_frame, cell.parent), else: world.frames[{cell.id, k - 1}].original
      frame = %{original: id, cell: cell.id, k: k, n: n, reply_to: reply_to, versions: [{id, world.clock, Xsim.Frames.frame_text(cell.id, {k, n, body})}]}
      world = %{world | frames: Map.put(world.frames, {cell.id, k}, frame), order: world.order ++ [{cell.id, k}], root: world.root || id}
      %{world | last_frame: Map.put(world.last_frame, cell.id, id)}
    end)
  end

  defp edit_cell(%{revisions: [_]}, world), do: world

  defp edit_cell(%{revisions: [_ | later]} = cell, world) do
    Enum.reduce(later, world, fn source, world ->
      parts = Xsim.Frames.split(cell.id, source)
      n = length(parts)
      old = for {{id, k}, _} <- world.frames, id == cell.id, do: k
      world = Enum.reduce(Enum.filter(old, &(&1 > n)), world, fn k, world -> drop_frame(world, cell.id, k) end)

      Enum.reduce(parts, world, fn {k, n, body}, world ->
        text = Xsim.Frames.frame_text(cell.id, {k, n, body})
        {id, world} = next_id(world)

        case world.frames[{cell.id, k}] do
          nil ->
            frame = %{original: id, cell: cell.id, k: k, n: n, reply_to: world.frames[{cell.id, k - 1}].original, versions: [{id, world.clock, text}]}
            %{world | frames: Map.put(world.frames, {cell.id, k}, frame), order: world.order ++ [{cell.id, k}]}

          frame ->
            %{world | frames: Map.put(world.frames, {cell.id, k}, %{frame | n: n, versions: frame.versions ++ [{id, world.clock, text}]})}
        end
      end)
    end)
  end

  defp drop_frame(world, cell, k), do: %{world | frames: Map.delete(world.frames, {cell, k}), order: List.delete(world.order, {cell, k})}

  defp lose(world, _cells, 0), do: world

  defp lose(world, cells, count) do
    candidates = for %{id: id} <- tl(cells), Map.has_key?(world.frames, {id, 2}), do: id
    step = max(div(length(candidates), count + 1), 1)
    chosen = candidates |> Enum.drop(step - 1) |> Enum.take_every(step) |> Enum.take(count)
    Enum.reduce(chosen, world, fn id, world -> %{drop_frame(world, id, 2) | lost: world.lost ++ [id]} end)
  end

  def posts(world, likes, base_time) do
    replies = world.frames |> Map.values() |> Enum.map(& &1.reply_to) |> Enum.reject(&is_nil/1) |> Enum.frequencies()

    for key <- world.order, frame = world.frames[key], {id, clock, text} <- frame.versions do
      history = Enum.map(frame.versions, &elem(&1, 0))
      metrics = %{reply_count: Map.get(replies, frame.original, 0), like_count: if(frame.k == 1, do: Map.get(likes, frame.cell, 0), else: 0)}
      refs = if frame.reply_to, do: [%{type: "replied_to", id: frame.reply_to}], else: []
      %{id: id, created_at: stamp(base_time, clock), text: text, conversation_id: world.root, edit_history: history, refs: refs, metrics: metrics}
    end
  end

  defp stamp(base_time, clock), do: base_time |> DateTime.add(clock, :second) |> DateTime.to_iso8601() |> String.replace("Z", ".000Z")

  def program(cells, world) do
    complete = for %{id: id, revisions: revisions} <- cells, id not in world.lost, do: rebuilt(id, world) || List.last(revisions)
    Enum.join(complete, "\n\n")
  end

  defp rebuilt(id, world) do
    parts = for {{cell, k}, frame} <- world.frames, cell == id, do: {k, frame}
    parts |> Enum.sort_by(&elem(&1, 0)) |> Enum.map_join(fn {_, frame} -> body_of(frame) end)
  end

  defp body_of(frame) do
    {_, _, text} = List.last(frame.versions)
    [_, body] = String.split(text, "\n", parts: 2)
    body
  end
end
