defmodule KevalaTest do
  use ExUnit.Case
  require NimbleCSV

  setup do
    data = File.read!("test/no_duplicates.csv")

    {:ok, data: data}
  end

  test "produces parsable CSV output", context do
    Kevala.process(context[:data], :email)

    assert File.read!("test/output.csv")
           |> NimbleCSV.RFC4180.parse_string(skip_headers: false)
           |> is_list()
  end
end
