# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elmix,
  ecto_repos: [Elmix.Repo]

# Configures the endpoint
config :elmix, Elmix.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3gcguDBaYPnDtCf+SesvtpL1UDcikafzpNTbHYSnvBvvXwMyoudLLfUwwe9Kp22j",
  render_errors: [view: Elmix.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Elmix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
