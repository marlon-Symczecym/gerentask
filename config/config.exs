# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gerentask,
  ecto_repos: [Gerentask.Repo]

# Configures the endpoint
config :gerentask, GerentaskWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qyDHj6JfCzFu4at7cik9STRAQ/7hB43FN55KRrPcsFHiKjsIO2M4Mt6fVmzvA0nA",
  render_errors: [view: GerentaskWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Gerentask.PubSub,
  live_view: [signing_salt: "GbXegf/+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
