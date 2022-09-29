defmodule Exlivery.Orders.OrderAgent do
  alias Exlivery.Orders.Order

  use Agent

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%Order{} = order) do
    uuid = UUID.uuid4()

    Agent.update(__MODULE__, &update_state(&1, order, uuid))

    {:ok, uuid}
  end

  def get(uuid), do: Agent.get(__MODULE__, &get_order(&1, uuid))

  defp get_order(state, uuid) do
    case Map.get(state, uuid) do
      nil -> {:error, "Invalid Key"}
      order -> {:ok, order}
    end
  end

  defp update_state(state, order, uuid), do: Map.put(state, uuid, order)
end
