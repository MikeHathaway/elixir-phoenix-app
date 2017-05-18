# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elixir_web_app,
  ecto_repos: [ElixirWebApp.Repo]

# Configures the endpoint
config :elixir_web_app, ElixirWebApp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lUIsr5tAMk4B4CEHQRpp7s4843KrkySJy+6Gmnvm02CDirHe0upN/QCh73ODT1Ty",
  render_errors: [view: ElixirWebApp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirWebApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# fixes problem with HTTpoison module
config :ssl, protocol_version: :"tlsv1.2"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
