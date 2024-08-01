defmodule Extrait.HTTPServer.Responder do
  @type method :: :GET | :POST | :PUT | :PATCH | :DELETE

  @callback resp(term(), method(), string()) :: Extrait.HTTPResponse.t()
end
