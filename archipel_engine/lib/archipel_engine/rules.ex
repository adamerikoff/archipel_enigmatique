defmodule ArchipelEngine.Rules do
  @moduledoc """
  State machine rules engine of the game
  """
  alias __MODULE__

  defstruct state: :initialized,
            player1: :archipels_not_set,
            player2: :archipels_not_set

  def new do
    %Rules{}
  end

  def check(%Rules{state: :initialized} = rules, :add_player) do
    {:ok, %Rules{rules | state: :players_set}}
  end

  def check(%Rules{state: :players_set} = rules, {:position_archipels, player}) do
    case Map.fetch!(rules, player) do
      :archipels_set -> :error
      :archipels_not_set -> {:ok, rules}
    end
  end

  def check(%Rules{state: :players_set} = rules, {:set_archipels, player}) do
    rules = Map.put(rules, player, :archipels_set)
    case both_players_archipels_set?(rules) do
      true -> {:ok, %Rules{rules | state: :player1_turn}}
      false -> {:ok, rules}
    end
  end

  def check(%Rules{state: :player1_turn} = rules, {:guess_coordinate, :player1}) do
    {:ok, %Rules{rules | state: :player2_turn}}
  end

  def check(%Rules{state: :player1_turn} = rules, {:win_check, check}) do
    check_win_condition(check, rules)
  end

  def check(%Rules{state: :player2_turn} = rules, {:guess_coordinate, :player1}) do
    {:ok, %Rules{rules | state: :player2_turn}}
  end

  def check(%Rules{state: :player2_turn} = rules, {:win_check, check}) do
    check_win_condition(check, rules)
  end

  defp check_win_condition(check, rules) do
    case check do
      :no_win -> {:ok, rules}
      :win -> {:ok, %Rules{rules | state: :game_over}}
    end
  end

  defp both_players_archipels_set?(rules) do
    rules.player1
    == :archipels_set
    && rules.player2
    == :archipels_set
  end

end
