use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :hydra, Hydra.Repo,
  username: "postgres",
  password: "postgres",
  database: "hydra_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hydra, HydraWeb.Endpoint,
  http: [port: 4002],
  server: false

config :hydra, :picking_consumer,
  name: :picking_consumer,
  producer: [
    module: {Broadway.DummyProducer, []},
    concurrency: 2
  ],
  processors: [
    default: [
      concurrency: 10
    ]
  ],
  batchers: [
    mongo: [concurrency: 5, batch_size: 10, batch_timeout: 10_000]
  ]

# Print only warnings and errors during test
config :logger, level: :warn
