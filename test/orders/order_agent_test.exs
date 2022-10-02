defmodule Exlivery.Orders.OrderAgentTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.OrderAgent

  describe "save/1" do
    test "saves the order and returns an uuid" do
      OrderAgent.start_link(%{})

      response =
        :order
        |> build()
        |> OrderAgent.save()

      assert response == {:ok, elem(response, 1)}
    end
  end

  describe "get/1" do
    setup do
      OrderAgent.start_link(%{})

      :ok
    end

    test "when the uuid exists, return the order" do
      order = build(:order)

      {:ok, uuid} = OrderAgent.save(order)

      response = OrderAgent.get(uuid)

      assert response == {:ok, order}
    end

    test "when the uuid does not exists, return an error" do
      response = UUID.uuid4() |> OrderAgent.get()

      assert response == {:error, "Invalid Key"}
    end
  end
end
