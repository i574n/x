defmodule Xsim.RunnerCrashTest do
  use ExUnit.Case, async: true
  alias Xsim.{Executors, Runner}

  test "a raising executor is recorded as one crashed key, not a dead run" do
    deliveries = [
      {0, {:post, "p0", nil, "inl a = 1"}},
      {1, {:like, "p0", "u1"}},
      {2, {:post, "p1", nil, "inl boom = 2"}},
      {3, {:like, "p1", "u1"}}
    ]

    fake = Executors.fake()
    executor = fn sources -> if Enum.any?(sources, &String.contains?(&1, "boom")), do: raise("boom"), else: fake.(sources) end
    state = Runner.run(deliveries, executor)

    crashed = for {_key, %{status: :crash}} <- state.results, do: :crash
    assert length(crashed) == 1
    assert map_size(state.results) == 2
  end

  test "an executor that exits is recorded as a crash too" do
    deliveries = [{0, {:post, "p0", nil, "inl a = 1"}}, {1, {:like, "p0", "u1"}}]
    state = Runner.run(deliveries, fn _ -> exit(:gone) end)
    assert [%{status: :crash}] = Map.values(state.results)
  end
end