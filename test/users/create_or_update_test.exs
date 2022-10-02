defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.CreateOrUpdate
  alias Exlivery.Users.UserAgent

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when params are valid, saves the user" do
      params = %{
        name: 'Gohan',
        email: 'a@b.com',
        cpf: "123123123",
        age: 25,
        address: "Gohan's House"
      }

      response = CreateOrUpdate.call(params)

      assert response == {:ok, "User Created Or Updated!"}
    end

    test "when params are invalid, returns an error" do
      params = %{
        name: 'Goten',
        email: 'a@b.com',
        cpf: "123123123",
        age: 12,
        address: "Gohan's House"
      }

      response = CreateOrUpdate.call(params)

      assert response == "Invalid Parameters"
    end
  end
end
