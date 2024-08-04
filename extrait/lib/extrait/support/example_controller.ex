defmodule Extrait.ExampleController do
  import Extrait.Controller
  import Plug.Conn

  def call(conn, action: action) do
    apply(__MODULE__, action, [conn, conn.params])
  end

  def greet(conn, _params) do
    conn
    |> put(status)
    |> render(:json, %{data: "hello world"})
  end
end
