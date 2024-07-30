defmodule Extrait.Application do

  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Task, fn -> Extrait.Server.start(4000) end}
    ]

    opts = [
      strategy: :one_for_one,
      name: Extrait.Supervisor
    ]

    Supervisor.start_link(children, opts)
  end
end
