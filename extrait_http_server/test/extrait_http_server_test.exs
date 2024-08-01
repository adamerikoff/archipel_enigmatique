defmodule ExtraitHttpServerTest do
  use ExUnit.Case
  doctest ExtraitHttpServer

  test "greets the world" do
    assert ExtraitHttpServer.hello() == :world
  end
end
