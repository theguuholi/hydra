defmodule Hydra.Pickings.Core.StorePickingsTest do
  use Hydra.DataCase
  alias Hydra.Pickings.Core.StorePickings
  alias Hydra.Repo
  import Mock

  test "should create pickings" do
    store =
      Repo.insert!(%Hydra.Stores.Store{
        name: "Sol Facil",
        description: "A Solfácil",
        lat: -23.564952023888395,
        email: "abobora@123",
        lng: -46.69231000929614
      })

    payload = %{
      "products" => [
        %{
          "product" => "abobora",
          "stores" => [store.id]
        },
        %{
          "product" => "melancia",
          "stores" => [store.id]
        }
      ]
    }

    with_mock(Mongo,
      insert_one: fn _, _, _ ->
        {:ok, %Mongo.InsertOneResult{acknowledged: true, inserted_id: "123213"}}
      end
    ) do
      assert StorePickings.store_pickings_into_mongo(payload) == [
               %Mongo.InsertOneResult{acknowledged: true, inserted_id: "123213"},
               %Mongo.InsertOneResult{acknowledged: true, inserted_id: "123213"}
             ]
    end
  end
end
