defmodule Exlivery.Orders.CreateOrUpdate do
  alias Exlivery.Orders.{Order, OrderAgent}
  alias Exlivery.Users.UserAgent
  alias Exlivery.Orders.Item

  def call(%{user: user, items: items}) do
    with {:ok, user} <- UserAgent.get(user),
         {:ok, items} <- build_items(items),
         {:ok, order} <- Order.build(user, items) do
      OrderAgent.save(order)
    else
      error -> error
    end
  end

  defp build_items(items) do
    items
    |> Enum.map(&build_item/1)
    |> handle_build()
  end

  defp build_item(%{
         description: description,
         category: category,
         unity_price: unity_price,
         quantity: quantity
       }) do
    case Item.build(description, category, unity_price, quantity) do
      {:ok, item} -> item
      {:error, _reason} = error -> error
    end
  end

  defp handle_build(items) do
    if Enum.all?(items, &is_struct/1), do: {:ok, items}, else: {:error, "Invalid Item(s)"}
  end
end
