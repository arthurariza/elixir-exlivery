defmodule Exlivery.Users.UserAgentTest do
  use ExUnit.Case

  alias Exlivery.Users.UserAgent

  import Exlivery.Factory

  describe "user/1" do
    test "returns the user" do
      UserAgent.start_link(%{})

      user = build(:user)

      response = UserAgent.save(user)

      assert response == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      user = build(:user, cpf: "12345678900")

      {:ok, user: user}
    end

    test "when cpf is found, return user", %{user: user} do
      UserAgent.save(user)

      response = UserAgent.get(user)

      assert response == {:ok, user}
    end

    test "when cpf is not found, return error", %{user: user} do
      response = UserAgent.get(user)

      assert response == {:error, "Invalid Key"}
    end
  end
end
