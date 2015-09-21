# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :media_bot, MediaBot.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "Skr/yaio/Vwi5rFMDGhphnndCwkWUzg5QGjt2GnaOQOs6DoBT9zkvzv48mbf8Xp8",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: MediaBot.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :phoenix_token_auth,
  user_model: MediaBot.User,                           # ecto model used for authentication
  repo: MediaBot.Repo,                                 # ecto repo
  crypto_provider: Comeonin.Bcrypt,                    # crypto provider for hashing passwords/tokens. see http://hexdocs.pm/comeonin/
  token_validity_in_minutes: 7 * 24 * 60,              # minutes from login until a token expires
  email_sender: "mediabot@jane.synology.me",           # sender address of emails sent by the app
  emailing_module: MediaBot.EmailConstructor,          # module implementing the `PhoenixTokenAuth.MailingBehaviour` for generating emails
  mailgun_domain: "jane.synology.me",                  # domain of your mailgun account
  mailgun_key: "secret",                               # secret key of your mailgun account
  user_model_validator: {MediaBot.Model, :user_validator} # function receiving and returning the changeset for a user on registration and when updating the account. This is the place to run custom validations.
