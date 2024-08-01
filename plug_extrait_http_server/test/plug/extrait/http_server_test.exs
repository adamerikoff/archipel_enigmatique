defmodule Plug.Extrait.HTTPServerTest do
  use ExUnit.Case
  doctest Plug.Extrait.HTTPServer

  test "greets the world" do
    assert Plug.Extrait.HTTPServer.hello() == :world
  end
end
