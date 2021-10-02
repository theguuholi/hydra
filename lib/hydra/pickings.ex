defmodule Hydra.Pickings do
  alias Hydra.Pickings.Core.SendProductToKafka

  def create_picking(products) do
    SendProductToKafka.execute(products)
  end

  def store_pickings_into_mongo(payload) do
    Task.async(fn ->
      :poolboy.transaction(
        :worker,
        fn pid ->
          GenServer.call(pid, {:insert_mongo, payload})
        end,
        6000
      )
    end)
  end
end
