defmodule Hydra.Pickings do
  alias Hydra.Pickings.Core.SendProductToKafka
  def create_picking(products) do
    SendProductToKafka.execute(products)
  end
end
