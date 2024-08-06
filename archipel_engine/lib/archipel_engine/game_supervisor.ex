defmodule ArchipelEngine.GameSupervisor do
  @moduledoc """
  Supervisor for managing running games.
  """
  use DynamicSupervisor

  alias ArchipelEngine.Game

  def start_link(_options) do
    DynamicSupervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def start_game(name) do
    spec = %{
      id: name,
      start: {Game, :start_link, [name]},
      type: :worker
    }
    DynamicSupervisor.start_child(__MODULE__, spec)
  end

  def stop_game(name) do
    :ets.delete(:game_state, name)
    case pid_from_name(name) do
      nil -> :ok
      pid -> DynamicSupervisor.terminate_child(__MODULE__, pid)
    end
  end

  def init(:ok) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  defp pid_from_name(name) do
    name
    |> Game.via_tuple()
    |> GenServer.whereis()
  end
end
