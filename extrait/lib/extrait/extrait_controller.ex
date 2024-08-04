defmodule Extrait.Controller do
  import Plug.Conn

  def render(conn, :json, data) when is_map(data) do
    status = conn.status || 200

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(status, Jason.encode!(data))
  end
end
