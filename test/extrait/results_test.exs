defmodule Extrait.ResultsTest do
  use ExUnit.Case
  alias Extrait.Results

  test "can add entries to the results" do
    Results.add_hash_for("path1", 111)
    Results.add_hash_for("path2", 444)
    Results.add_hash_for("path3", 111)
    Results.add_hash_for("path4", 333)
    Results.add_hash_for("path5", 444)
    Results.add_hash_for("path6", 987)

    duplicates = Results.find_duplicates()

    assert length(duplicates) == 2

    assert ~w{path3 path1} in duplicates
    assert ~w{path5 path2} in duplicates
  end
end
