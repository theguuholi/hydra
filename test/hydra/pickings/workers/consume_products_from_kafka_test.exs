defmodule Hydra.Pickings.Workers.ConsumeProductsFromKafkaTest do
  use ExUnit.Case, async: true
  alias Hydra.Pickings.Workers.ConsumeProductsFromKafka

  test "test message" do
    ref = Broadway.test_message(ConsumeProductsFromKafka, 1)
    assert_receive {:ack, ^ref, [%{data: 1}], []}
  end
end
