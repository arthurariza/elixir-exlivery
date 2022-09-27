defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid" do
      response = User.build("Goku", "a@b.com", "123123123", 35, "Goku's House")

      assert response == {:ok, build(:user)}
    end

    test "when user is underage" do
      response = User.build("Goten", "a@b.com", "123123123", 12, "Goku's House")

      assert response == {:error, "Invalid Parameters"}
    end
  end
end
