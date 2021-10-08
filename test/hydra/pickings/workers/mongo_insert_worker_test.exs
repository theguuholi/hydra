defmodule Hydra.Pickings.Worker.MongoInsertWorkerTest do
  use ExUnit.Case, async: true
  import Mock

  alias Hydra.Pickings.Worker.MongoInsertWorker
  alias Hydra.Pickings.Core.StorePickings


  setup do
    mongo_insert_worker = start_supervised!(MongoInsertWorker)
    %{mongo_insert_worker: mongo_insert_worker}
  end

  test "should test sync call", %{mongo_insert_worker: mongo_insert_worker} do
    payload = %{
      "products" => [
        %{
          "product" => "abobora",
          "stores" => ["123"]
        }
      ]
    }

    with_mock(StorePickings,
      store_pickings_into_mongo: fn _ ->
        [%Mongo.InsertOneResult{acknowledged: true, inserted_id: "123213"}]
      end
    ) do
          result = GenServer.call(mongo_insert_worker, {:insert_mongo, payload})
      expected = [%Mongo.InsertOneResult{acknowledged: true, inserted_id: "123213"}]
      assert expected == result
    end
  end
end
