# defmodule Hydra.Pickings.Workers.ConsumeProductsFromKafkaTest do
#   use ExUnit.Case, async: true
#   alias Hydra.Pickings.Workers.ConsumeProductsFromKafka
#   alias Hydra.Pickings
#   import Mock

#   test "test message" do
#     product = %{
#       "products" => [
#         %{
#           "product" => "abobora",
#           "stores" => ["123"]
#         }
#       ]
#     }

#     with_mock(Pickings,
#     store_pickings_into_mongo: fn _ ->
#         [%Mongo.InsertOneResult{acknowledged: true, inserted_id: "123213"}]
#       end
#     ) do
#       # ref = Broadway.test_message(:picking_consumer, Jason.encode!(product))
#       ref = Broadway.test_batch(:picking_consumer, [Jason.encode!(product)], batch_mode: :flush)
#       IO.inspect(ref)
#       assert_receive {:ack, ^ref, [], []}, 1000
#       # assert_receive {:DOWNk, ^ref, _, _, :normal}

#     end
#   end
# end
