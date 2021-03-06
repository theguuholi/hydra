defmodule Hydra.MixProject do
  use Mix.Project

  def project do
    [
      app: :hydra,
      version: "0.1.0",
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Hydra.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5.13"},
      {:phoenix_ecto, "~> 4.4"},
      {:ecto_sql, "~> 3.4"},
      {:postgrex, ">= 0.0.0"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false}, # Analise de Codigo
      {:excoveralls, "~> 0.10", only: :test}, # Cobertura de Testes
      {:mix_test_watch, "~> 1.0", only: :dev}, # TDD

      {:absinthe, "~> 1.6"}, #GraphQl
      {:absinthe_relay, "~> 1.5", override: true},
			#https://relay.dev construir apps escalaveis
      {:absinthe_plug, "~> 1.5", override: true},
      {:absinthe_phoenix, "~> 2.0"}, #utilizar com websockets
      {:absinthe_error_payload, "~> 1.1"}, #lidar com erros de maneira Simples
      {:dataloader, "~> 1.0.0"}, #lidar com queries de banco de dados
      {:mock, "~> 0.3.0", only: :test}, # para mocar dados,

			{:brod, "~> 3.15"},
      {:broadway, "~> 1.0"},
      {:broadway_kafka, "~> 0.3.0"},
      {:mongodb_driver, "~> 0.7.4"},
      {:poolboy, ">= 0.0.0"},
      {:benchee, "~> 1.0", only: :dev}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end
end
