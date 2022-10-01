defmodule Exlivery do
  alias Exlivery.Users.CreateOrUpdate, as: CreateOrUpdateUser
  alias Exlivery.Users.UserAgent
  alias Exlivery.Orders.OrderAgent
  alias Exlivery.Orders.CreateOrUpdate, as: CreateOrUpdateOrders

  def start_agents do
    UserAgent.start_link(%{})
    OrderAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_orders(params), to: CreateOrUpdateOrders, as: :call
end
