defmodule ArchipelEngine.Archipel do
  alias ArchipelEngine.{Coordinate, Archipel}

  @archipel_types [:square, :dot, :atoll, :l_shape, :s_shape]

  @enforce_keys [:coordinates, :hit_coordinates]
  defstruct [:coordinates, :hit_coordinates]

  def types(), do: @archipel_types

  def new(type, %Coordinate{} = upper_left) do
      with  {:ok, [_|_] = offset} <- offsets(type),
            %MapSet{} = coordinates <- add_coordinates(offset, upper_left)
      do
        {:ok, %Archipel{coordinates: coordinates, hit_coordinates: MapSet.new()}}
      else
        error -> error
      end
    end

  def overlaps?(existing_archipel, new_archipel) do
    not MapSet.disjoint?(existing_archipel.coordinates, new_archipel.coordinates)
  end

  def guess(archipel, coordinate) do
    case MapSet.member?(archipel.coordinates, coordinate) do
      true ->
        hit_coordinates = MapSet.put(archipel.hit_coordinates, coordinate)
        {:hit, %{archipel | hit_coordinates: hit_coordinates}}
      false -> :miss
    end
  end

  def forested?(archipel) do
    MapSet.equal?(archipel.coordinates, archipel.hit_coordinates)
  end

  defp add_coordinates(offsets, upper_left) do
    Enum.reduce_while(
      offsets, MapSet.new(),
      fn offset, acc ->
        add_coordinate(acc, upper_left, offset)
      end)
  end

  defp add_coordinate(
    coordinates,
    %Coordinate{row: row, col: col},
    {row_offset, col_offset}
  ) do
    case Coordinate.new(row + row_offset, col + col_offset) do
      {:ok, coordinate} ->
        {:cont, MapSet.put(coordinates, coordinate)}
      {:error, :invalid_coordinate} ->
        {:halt, {:error, :invalid_coordinate}}
    end
  end

  defp offsets(:square), do: {:ok, [{0, 0}, {0, 1}, {1, 0}, {1, 1}]}
  defp offsets(:atoll),  do: {:ok, [{0, 0}, {0, 1}, {1, 1}, {2, 0}, {2, 1}]}
  defp offsets(:dot),    do: {:ok, [{0, 0}]}
  defp offsets(:l_shape), do: {:ok, [{0, 0}, {1, 0}, {2, 0}, {2, 1}]}
  defp offsets(:s_shape), do: {:ok, [{0, 1}, {0, 2}, {1, 0}, {1, 1}]}
  defp offsets(_), do: {:error, :invalid_archipel_type}
end
