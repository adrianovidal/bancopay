# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bancopay,
  ecto_repos: [Bancopay.Repo]

# Configures the endpoint
config :bancopay, BancopayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IaE2COm311GsgwOPfBZyfeaALSjJllbBacaKqPBwnob9nrmMYqxN2bMpbNO6RrDN",
  render_errors: [view: BancopayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Bancopay.PubSub,
  live_view: [signing_salt: "nC/aW3d8"]

config :bancopay, Bancopay.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :bancopay, :basic_auth,
  username: "banana",
  password: "nanica123"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
