defmodule ArchipelEnigmatique.Archipel do
  alias ArchipelEnigmatique.{Coordinate, Archipel}

  @enforce_keys [:coordinates, :hit_coordinates]
  defstruct [:coordinates, :hit_coordinates]

  def new() do
    %Archipel{coordinates: MapSet.new(), hit_coordinates: MapSet.new()}
  end
end
