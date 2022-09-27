defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  def user_factory do
    %User{
      age: 35,
      cpf: "123123123",
      email: "a@b.com",
      name: "Goku",
      address: "Goku's House"
    }
  end
end
