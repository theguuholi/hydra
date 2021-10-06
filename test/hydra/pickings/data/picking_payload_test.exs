defmodule Hydra.Pickings.Data.PickingPayloadTest do
  use Hydra.DataCase
  alias Hydra.Pickings.Data.PickingPayload

  test "should create picking" do
    store = %{
      id: "3232",
      description: "3232",
      name: "3232",
      lat: "3232",
      lng: "3232"
    }

    assert PickingPayload.new(store, "abobora 123") == %PickingPayload{
             delivered: false,
             product: "abobora 123",
             store: %{description: "3232", id: "3232", lat: "3232", lng: "3232", name: "3232"}
           }
  end
end
