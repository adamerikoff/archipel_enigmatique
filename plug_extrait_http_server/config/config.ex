import Config

config :extrait_http_server,
  dispatcher: {
    Plug.Extrait.HTTPServer,
    [
      plug: ExampleRouter,
      options: []
    ]
  }
