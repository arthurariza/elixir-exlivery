defmodule Exlivery.Users.CreateOrUpdate do
  alias Exlivery.Users.UserAgent
  alias Exlivery.Users.User

  def call(%{name: name, email: email, cpf: cpf, age: age, address: address}) do
    name
    |> User.build(email, cpf, age, address)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}) do
    UserAgent.save(user)
    {:ok, "User Created Or Updated!"}
  end

  defp save_user({:error, error}), do: error
end
