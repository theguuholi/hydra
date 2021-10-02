defmodule Hydra.Pickings do
  alias Hydra.Pickings.Core.SendProductToKafka
  alias Hydra.Pickings.Core.StorePickings
  def create_picking(products) do
    SendProductToKafka.execute(products)
  end

  def store_pickings_into_mongo(payload) do
    StorePickings.store_pickings_into_mongo(payload)
  end
end
