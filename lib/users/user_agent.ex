defmodule Exlivery.Users.UserAgent do
  alias Exlivery.Users.User

  use Agent

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%User{} = user), do: Agent.update(__MODULE__, &update_state(&1, user))

  def get(user), do: Agent.get(__MODULE__, &get_user(&1, user))

  defp get_user(state, %User{cpf: cpf}) do
    case Map.get(state, cpf) do
      nil -> {:error, "Invalid Key"}
      user -> {:ok, user}
    end
  end

  defp update_state(state, %User{cpf: cpf} = user), do: Map.put(state, cpf, user)
end
