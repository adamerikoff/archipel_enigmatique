defmodule Extrait.ExampleRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  match _ do
    send_resp(conn, 404, "Not Found")
  end

  get "/greet" do
    Extrait.ExampleController.call(conn, action: :greet)
  end
end
