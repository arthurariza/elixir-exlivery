defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

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

  def order_factory do
    %User{address: address, cpf: cpf} = build(:user)

    %Order{
      delivery_address: address,
      items: [
        build(:item),
        build(:item)
      ],
      total_price: Decimal.new("2.00"),
      user_cpf: cpf
    }
  end
end
