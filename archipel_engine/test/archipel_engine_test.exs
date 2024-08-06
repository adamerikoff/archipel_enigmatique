defmodule ArchipelEngineTest do
  use ExUnit.Case
  doctest ArchipelEngine

  test "greets the world" do
    assert ArchipelEngine.hello() == :world
  end
end
