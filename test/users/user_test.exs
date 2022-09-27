defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid" do
      response = User.build("Arthur", "a@b.com", "123123123", 27, "Rua Um")

      assert response ==
               {:ok,
                %User{
                  address: "Rua Um",
                  age: 27,
                  cpf: "123123123",
                  email: "a@b.com",
                  name: "Arthur"
                }}
    end

    test "when user is underage" do
      response = User.build("Gohan", "a@b.com", "123123123", 12, "Rua Um")

      assert response == {:error, "Invalid Parameters"}
    end
  end
end
