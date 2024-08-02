defmodule Plug.Extrait.HTTPServer.MixProject do
  use Mix.Project

  def project do
    [
      app: :plug_extrait_http_server,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:extrait_http_server, path: "../extrait_http_server/"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
