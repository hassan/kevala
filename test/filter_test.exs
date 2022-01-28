defmodule FilterTest do
  use ExUnit.Case, async: false

  setup do
    lines = [
      ~w(bob example bob@example.com 8005551212),
      ~w(robert example bob@example.com 8005551212),
      ~w(bob example bob.example@example.com 8005551212)
    ]

    {:ok, lines: lines}
  end

  describe "filter by" do
    test "email", context do
      assert length(Kevala.Filter.insert_all(context[:lines], :email)) == 2
    end

    test "phone", context do
      assert length(Kevala.Filter.insert_all(context[:lines], :phone)) == 1
    end

    test "email or phone", context do
      assert length(Kevala.Filter.insert_all(context[:lines], :email_or_phone)) == 1
    end
  end
end
