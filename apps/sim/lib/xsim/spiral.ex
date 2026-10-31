defmodule Xsim.Spiral do
  @gleam_build Path.expand("../../frames/build/dev/erlang", __DIR__)

  def call(fun, args), do: call(:xsim_frames, fun, args)

  def call(module, fun, args) do
    unless :persistent_term.get({__MODULE__, :loaded}, false) do
      for ebin <- Path.wildcard(Path.join(@gleam_build, "*/ebin")), do: Code.prepend_path(ebin)
      :persistent_term.put({__MODULE__, :loaded}, true)
    end

    apply(module, fun, args)
  end

  def listed({_cons, head, tail}), do: [head | listed(tail)]
  def listed(empty) when is_atom(empty), do: []

  def scenario_stream(cells, seed, users, edits, personas, permille, framed \\ true),
    do: call(:scenario_stream, [Enum.join(cells, <<0>>), seed, users, edits, personas, permille, framed])

  def scenario_final(cells, seed, users, edits, personas, permille, framed \\ true),
    do: call(:scenario_final, [Enum.join(cells, <<0>>), seed, users, edits, personas, permille, framed])

  def corpus_run(threads, opts) do
    joined = threads |> Enum.map(&Enum.join(&1, <<0>>)) |> Enum.join(<<1>>)
    settings = [opts[:seed] || 1, opts[:users] || 8, opts[:edits] || 3, opts[:breaking] || 0, opts[:churn] || 0, opts[:personas] || ""]
    {text, posts, events, broken} = call(:corpus_run, [joined | settings] ++ [opts[:frames] || false, opts[:schedule] || 1, opts[:permille] || 100])
    {text, posts, events, broken |> String.split(<<0>>, trim: true) |> MapSet.new()}
  end

  def simulated_lines(args, threads, root) do
    joined = threads |> Enum.map(&Enum.join(&1, <<0>>)) |> Enum.join(<<1>>)
    call(:simulated_lines, [Enum.join(args, <<0>>), joined, root]) |> String.split("\n")
  end

  def world_files(cells, opts) do
    args = [opts[:seed] || 1, opts[:edits] || 0, opts[:personas] || "", opts[:id_base] || 3_000_000, opts[:lost] || 0, opts[:lost_cells] || 0]
    call(:world_files, [Enum.join(cells, <<0>>) | args] ++ [opts[:base_time] || "2026-10-18T08:00:00Z", opts[:user_id] || "500", opts[:username] || "spiralposts"])
  end
end
