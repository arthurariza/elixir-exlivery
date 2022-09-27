defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.Item

  def user_factory do
    %User{
      age: 35,
      cpf: "123123123",
      email: "a@b.com",
      name: "Goku",
      address: "Goku's House"
    }
  end

  def item_factory do
    %Item{
      description: "Item",
      category: :pizza,
      unity_price: Decimal.new("1.00"),
      quantity: 1
    }
  end
end
