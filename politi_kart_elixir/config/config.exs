# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :politi_kart_elixir, PolitiKartElixir.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "ppPwi1sJHH+ZQIDCp1oUv6T4OslgYbXfrMJARuRSyXyIghNJQjdfc/L2wgKLPEbz",
	render_errors: [accepts: ~w(html json)],
  pubsub: [name: PolitiKartElixir.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :politi_kart_elixir, PolitiKartElixir.PageController,
	google_api_key: "TODO: insert google key her" 

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure phoenix generators
config :extwitter, :oauth, [
   consumer_key: "TODO: insert here",
   consumer_secret: "TODO: insert here",
   access_token: "TODO: insert here",
   access_token_secret: "TODO: insert here"
]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :phoenix, :generators,
  migration: true,
  binary_id: false
