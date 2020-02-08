# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pow_example, :pow,
  user: PowExample.Users.User,
  repo: PowExample.Repo

config :pow_example,
  ecto_repos: [PowExample.Repo]

# Configures the endpoint
config :pow_example, PowExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9All2tsELkSu32Ov3+Fa1nr7FmPn4ToussuIgxglLIi84HU66gkz+H5PaqI/0/rD",
  render_errors: [view: PowExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PowExample.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
