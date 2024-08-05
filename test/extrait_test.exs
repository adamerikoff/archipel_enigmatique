defmodule ExtraitTest do
  use ExUnit.Case
  doctest Extrait

  test "greets the world" do
    assert Extrait.hello() == :world
  end
end
