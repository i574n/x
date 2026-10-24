defmodule Xsim.SpiralTest do
  use ExUnit.Case, async: true

  @client Path.expand("../../client", __DIR__)

  defp cells(name) do
    doc = Spiral.Cells.Document.parse_spi(File.read!(Path.join(@client, name)), "")
    for %{kind: :spiral, source: source} <- doc.cells, do: source
  end

  defp elixir_stream(cells, seed, users, edits, personas) do
    scenario = Xsim.Scenario.from_cells(cells, seed: seed, users: users, edits: edits, personas: Xsim.Personas.parse(personas))
    framed = %{scenario | events: Xsim.Frames.explode_posts(scenario.events)}
    Xsim.Log.encode(Xsim.Scenario.deliveries(framed, schedule_seed: 1, duplicates: 0.2))
  end

  test "the Spiral scenario writes the event fixture byte for byte" do
    expected = File.read!(Path.expand("../fixtures/prelude.events.jsonl", __DIR__))
    assert Xsim.Spiral.scenario_stream(cells("prelude.spi"), 3, 3, 2, "fickle=1+editor=1", 200) == expected
  end


  test "the Spiral replay reaches the final state fixture" do
    expected = File.read!(Path.expand("../fixtures/prelude.final.json", __DIR__))
    assert Xsim.Spiral.scenario_final(cells("prelude.spi"), 3, 3, 2, "fickle=1+editor=1", 200) == expected
  end

  @worlds [
    {"sim-small", "prelude.spi", 3, [id_base: 3_000_000, user_id: "500", username: "spiralposts"]},
    {"sim-stress", "posts.spi", nil, [seed: 7, edits: 3, personas: "editor=2+breaker=1", id_base: 4_000_000, user_id: "501", username: "spiralstress"]},
    {"sim-lost", "prelude.spi", 3, [lost: 1, base_time: "2026-08-01T08:00:00Z", id_base: 5_000_000, user_id: "502", username: "spirallost"]},
    {"sim-gap", "prelude.spi", nil, [lost_cells: 1, id_base: 6_000_000, user_id: "503", username: "spiralgap"]}
  ]

  test "the Spiral world writes every e2e world and its expected program" do
    for {name, spi, limit, opts} <- @worlds do
      cells = if limit, do: Enum.take(cells(spi), limit), else: cells(spi)
      {world, expected} = Xsim.Spiral.world_files(cells, opts)
      assert world == File.read!(Path.join(@client, "e2e/#{name}.world.json")), name
      assert expected == File.read!(Path.join(@client, "e2e/#{name}.expected.json")), name
    end
  end

  test "a corpus run and the scenario facade draw the same deliveries" do
    threads = [cells("prelude.spi"), cells("posts.spi")]
    opts = [seed: 2, users: 3, edits: 3, breaking: 1, churn: 2, personas: "lurker=2+fickle=3+editor=2+breaker=2"]
    scenario = Xsim.Scenario.from_corpus(threads, Keyword.put(opts, :personas, Xsim.Personas.parse(opts[:personas])))
    framed = %{scenario | events: Xsim.Frames.explode_posts(scenario.events)}

    for schedule <- 1..2 do
      {text, posts, events, broken} = Xsim.Spiral.corpus_run(threads, opts ++ [frames: true, schedule: schedule, permille: 150])
      assert text == Xsim.Log.encode(Xsim.Scenario.deliveries(framed, schedule_seed: schedule, duplicates: 0.15))
      assert {posts, events, broken} == {length(scenario.posts), length(framed.events), scenario.broken}
    end
  end

  test "the scenario facade and the direct stream draw the same deliveries" do
    cells = cells("posts.spi")

    for {seed, personas} <- [{5, "lurker=2+breaker=1"}, {9, "editor=1+fickle=2+breaker=1"}] do
      assert Xsim.Spiral.scenario_stream(cells, seed, 4, 3, personas, 200) == elixir_stream(cells, seed, 4, 3, personas)
    end
  end
end
