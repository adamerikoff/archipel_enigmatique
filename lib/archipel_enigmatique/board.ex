defmodule ArchipelEnigmatique.Board do
  alias ArchipelEnigmatique.{Coordinate, Archipel}

  def new()  do
    {:ok, %{}}
  end

  def position_archipel(board, key, %Archipel{} = archipel) do
    case overlaps_existing_archipel?(board, key, archipel) do
      true -> {:error, :overlapping_archipel}
      false -> {:ok, Map.put(board, key, archipel)}
    end
  end

  defp overlaps_existing_archipel?(board, new_key, new_archipel) do
    Enum.any?(board,
      fn {key, archipel} ->
        key != new_key and Archipel.overlaps?(archipel, new_archipel)
      end
    )
  end

  def all_archipels_positioned?(board) do
    Enum.all?(Archipel.types, &(Map.has_key?(board, &1)))
  end

  def guess(board, %Coordinate{} = coordinate) do
    board
    |> check_all_archipels(coordinate)
    |> guess_response(board)
  end

  defp check_all_archipels(board, coordinate) do
    Enum.find_value(board, :miss,
      fn {key, archipel} ->
        case Archipel.guess(archipel, coordinate) do
          {:hit, archipel} -> {key, archipel}
          :miss -> false
        end
      end
    )
  end

  defp guess_response({key, archipel}, board) do
    board = %{board | key => archipel}
    {:hit, forest_check(board, key), win_check(board), board}
  end

  defp guess_response(:miss, board) do
    {:miss, :none, :no_win, board}
  end

  defp forest_check(board, key) do
    case forested?(board, key) do
      true -> key
      false -> :none
    end
  end

  defp forested?(board, key) do
    board
    |> Map.fetch!(key)
    |> Archipel.forested?()
  end

  defp win_check(board) do
    case all_forested?(board) do
      true -> :win
      false -> :no_win
    end
  end

  defp all_forested?(board) do
    Enum.all?(
      board,
      fn {_key, archipel} ->
        Archipel.forested?(archipel)
      end
    )
  end
end
