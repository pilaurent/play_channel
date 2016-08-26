# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :play_channel,
  ecto_repos: [PlayChannel.Repo]

# Configures the endpoint
config :play_channel, PlayChannel.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "S8mt7kIUVN9csHTb0jYjKSH9ggstrx80eJvhoDWr8Jq7Ie2P1iniEGIa/z9nEcYu",
  render_errors: [view: PlayChannel.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PlayChannel.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
