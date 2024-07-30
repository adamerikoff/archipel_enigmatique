defmodule Extrait.Router do
  require Logger

  def routes do
    [
      {:_, [{"/", __MODULE__, []}]}
    ]
  end

  def init(req, state) do
    Logger.info("Received request: #{inspect req}")

    req = :cowboy_req.reply(
      200,
      %{"content-type" => "text/html"},
      "Bonjour!",
      req
    )

    {:ok, req, state}
  end
end
