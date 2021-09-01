# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :mvp_api,
  ecto_repos: [MvpApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :mvp_api, MvpApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  render_errors: [view: MvpApiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: MvpApi.PubSub,
  live_view: [signing_salt: "7zBwEPPK"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# I need to configure my Guardian with my a secret key and how long the json web token is valid.
config :mvp_api, MvpApi.Guardian,
  issuer: "mvp_api",
  secret_key: "gbNZVl1WwB3UQO4XtsorYgPY/4ArQ6Fqfqsxb8RN0v1qPhoJnUs38NWjNkJ2qTwf",
  ttl: {3, :days}

config :mvp_api, MvpApiWeb.AuthAccessPipeline,
  module: MvpApi.Guardian,
  error_handler: MvpApiWeb.AuthErrorHandler

# Kaffy
config :kaffy,
  otp_app: :mvp_api,
  ecto_repo: MvpApi.Repo,
  router: MvpApiWeb.Router,
  admin_title: "MVP",
  hide_dashboard: false,
  resources: [
    client: [
      name: "Cliente",
      resources: [
        product: [schema: MvpApi.Client.Product, admin: MvpApiWeb.Kaffy.ProductAdmin],
        factor: [schema: MvpApi.Client.Factor]
      ]
    ]
  ]

config :ex_money,
  auto_start_exchange_rate_service: false,
  exchange_rates_retrieve_every: 300_000,
  api_module: Money.ExchangeRates.OpenExchangeRates,
  callback_module: Money.ExchangeRates.Callback,
  retriever_options: nil,
  log_failure: :warn,
  log_info: :info,
  log_success: nil,
  json_library: Jason,
  default_cldr_backend: MvpApi.Cldr

config :ex_cldr,
  json_library: Jason
