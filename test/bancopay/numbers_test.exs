defmodule Bancopay.NumbersTest do
  use ExUnit.Case

  alias Bancopay.Numbers

  describe "sum_from_file/1" do
    test "whan there is a file with the given name, return de sum of numbers" do
      response = Numbers.sum_from_file("numbers")

      expected_response = {:ok, %{result: 37}}

      assert response == expected_response
    end

    test "whan there no file with the given name, return an error" do
      response = Numbers.sum_from_file("banana")

      expected_response = {:error, %{message: "Invalid file!"}}

      assert response == expected_response
    end
  end
end
