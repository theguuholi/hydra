defmodule Hydra.PickingsTest do
  use Hydra.DataCase
  alias Hydra.Pickings

  alias Hydra.Pickings.Core.SendProductToKafka
  alias Hydra.Pickings.Core.StorePickings

  import Mock

  test "should create picking" do
    products = %{
      products: [
        %{product: "123", stores: ["123", "123123"]},
        %{product: "123", stores: ["123", "123123"]}
      ]
    }

    with_mock(SendProductToKafka,
      execute: fn _param -> {:ok, {:brod_call_ref, 123, 123, "abc"}} end
    ) do
      assert Pickings.create_picking(products) == {:ok, {:brod_call_ref, 123, 123, "abc"}}
    end
  end

  test "should store picking into mongo" do
    products = %{
      products: [
        %{product: "123", stores: ["123", "123123"]},
        %{product: "123", stores: ["123", "123123"]}
      ]
    }

    with_mock(StorePickings,
      store_pickings_into_mongo: fn _ ->
        [%Mongo.InsertOneResult{acknowledged: true, inserted_id: "123213"}]
      end
    ) do
      task = Pickings.store_pickings_into_mongo(products)
      ref = task.ref
      assert_receive {:DOWN, ^ref, _, _, :normal}
    end
  end
end
