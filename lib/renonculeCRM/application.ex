defmodule RenonculeCRM.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RenonculeCRMWeb.Telemetry,
      RenonculeCRM.Repo,
      {DNSCluster, query: Application.get_env(:renonculeCRM, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: RenonculeCRM.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: RenonculeCRM.Finch},
      # Start a worker by calling: RenonculeCRM.Worker.start_link(arg)
      # {RenonculeCRM.Worker, arg},
      # Start to serve requests, typically the last entry
      RenonculeCRMWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RenonculeCRM.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RenonculeCRMWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
