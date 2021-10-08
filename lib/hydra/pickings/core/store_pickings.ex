defmodule Hydra.Pickings.Core.StorePickings do
  alias Hydra.Repo
  alias Hydra.Stores.Store
  alias Hydra.Pickings.Data.PickingPayload

  def store_pickings_into_mongo(%{"products" => products}) do
    products
    |> build_payload_per_product()
    |> insert_into_mongo
  end

  defp build_payload_per_product(products) do
    products
    |> Enum.map(&build_payload_to_insert_into_mongo_per_store(&1["stores"], &1["product"]))
    |> List.flatten()
  end

  defp build_payload_to_insert_into_mongo_per_store(stores, product_name) do
    stores
    |> Enum.map(fn store_id ->
      Store
      |> Repo.get(store_id)
      |> PickingPayload.new(product_name)
    end)
  end

  defp insert_into_mongo(products) do
    Enum.map(products, &perform_insert/1)
  end

  defp perform_insert(product) do
    {:ok, response} = Mongo.insert_one(:mongo, "orders", product)
    response
  end
end
