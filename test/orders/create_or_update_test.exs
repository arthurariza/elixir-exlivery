defmodule Exlivery.Orders.CreateOrUpdateTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.CreateOrUpdate
  alias Exlivery.Orders.OrderAgent
  alias Exlivery.Users.UserAgent

  describe "call/1" do
    test "when all params are valid, creates or replaces an order" do
      UserAgent.start_link(%{})
      OrderAgent.start_link(%{})

      user =
        :user
        |> build()

      UserAgent.save(user)

      items = [build(:item), build(:item), build(:item)]

      response = CreateOrUpdate.call(%{user: user, items: items})

      assert {:ok, _uuid} = response
    end

    test "when at least one param is invalid, return an error" do
      UserAgent.start_link(%{})
      OrderAgent.start_link(%{})

      user =
        :user
        |> build(age: 12)

      UserAgent.save(user)

      items = [build(:item), %{}, build(:item)]

      response = CreateOrUpdate.call(%{user: user, items: items})

      assert response == 1
    end
  end
end
