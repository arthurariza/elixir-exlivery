defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all params are valid" do
      response = Item.build("Item", :pizza, "1.00", 1)

      assert response == {:ok, build(:item)}
    end

    test "when quantity is less than 1" do
      response = Item.build("Item", :pizza, "1.00", 0)

      assert response == {:error, "Invalid Parameters"}
    end

    test "when category is invalid" do
      response = Item.build("Item", :pasta, "1.00", 2)

      assert response == {:error, "Invalid Parameters"}
    end

    test "when price is invalid" do
      invalid_prices = ["price", [], %{}, nil]

      invalid_prices
      |> Enum.each(fn price ->
        assert Item.build("Item", :pizza, price, 1) == {:error, "Invalid Price"}
      end)
    end
  end
end
