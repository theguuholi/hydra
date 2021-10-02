defmodule HydraGraphql.Resolvers.PickingResolver do

  def create_picking(_parent, params, _resolution) do
    {:ok, "We received the payload, and we are going to create all orders!"}
  end
end
