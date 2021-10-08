defmodule Hydra.Pickings.Workers.ConsumeProductsFromKafkaTest do
  use ExUnit.Case, async: true
  alias Hydra.Pickings
  import Mock

  test "test message" do
    product = %{
      "products" => [
        %{
          "product" => "abobora",
          "stores" => ["123"]
        }
      ]
    }

    with_mock(Pickings, store_pickings_into_mongo: fn _ -> :ok end) do
      ref = Broadway.test_batch(:picking_consumer, [Jason.encode!(product)], batch_mode: :flush)
      assert_receive {:ack, ^ref, _, _}, 1000
    end
  end
end
