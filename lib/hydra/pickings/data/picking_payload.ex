defmodule Hydra.Pickings.Data.PickingPayload do
  defstruct ~w/store product delivered/a

  def new(store, product_name) do
    %__MODULE__{
      store: %{
        id: store.id,
        description: store.description,
        name: store.name,
        lat: store.lat,
        lng: store.lng
      },
      product: product_name,
      delivered: false
    }
  end
end
