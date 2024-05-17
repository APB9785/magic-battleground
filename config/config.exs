# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :magic_battleground,
  ecto_repos: [MagicBattleground.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :magic_battleground, MagicBattlegroundWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: MagicBattlegroundWeb.ErrorHTML, json: MagicBattlegroundWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: MagicBattleground.PubSub,
  live_view: [signing_salt: "pCDIvaSd"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :magic_battleground, MagicBattleground.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  magic_battleground: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.4.0",
  magic_battleground: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ecsx,
  tick_rate: 20,
  manager: MagicBattleground.Manager

config :live_view_native,
  plugins: [LiveViewNative.SwiftUI]

config :live_view_native_stylesheet,
  content: [
    swiftui: ["lib/**/*swiftui*"]
  ],
  output: "priv/static/assets"

config :phoenix,
  json_library: Jason,
  template_engines: [neex: LiveViewNative.Engine]

config :phoenix_template, :format_encoders, swiftui: Phoenix.HTML.Engine

config :mime, :types, %{
  "text/swiftui" => ["swiftui"],
  "text/styles" => ["styles"]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
