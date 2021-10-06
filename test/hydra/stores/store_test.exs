defmodule Hydra.Stores.StoreTest do
  use Hydra.DataCase
  alias Hydra.Stores.Store

  test "should handle with changeset" do

    store = Store.changeset(%Store{}, %{
      description: "3232",
      name: "3232",
      lat: "3232",
      lng: "3232",
      email: "3434"
    })

    assert store.valid? == true
  end
end
