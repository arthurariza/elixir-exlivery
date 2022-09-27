defmodule Exlivery.Orders.OrderTest do
  use ExUnit.Case

  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "build/2" do
    test "when all params are valid" do
      response = Order.build(build(:user), [build(:item), build(:item)])

      assert response == {:ok, build(:order)}
    end

    test "when item list is empty" do
      response = Order.build(build(:user), [])

      assert response == {:error, "Invalid parameters"}
    end

    test "when parameters are invalid" do
      response = Order.build(%{}, [])

      assert response == {:error, "Invalid parameters"}
    end
  end
end
