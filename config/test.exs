import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :phoenix_crud, PhoenixCrud.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "phoenix_crud_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_crud, PhoenixCrudWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "6labZyS4HsIppsYcFi3L3Rnf1oAmvANrWbzc6Y5m0VY/v6wSE+bylJMBsK7zHAV4",
  server: false

# In test we don't send emails.
config :phoenix_crud, PhoenixCrud.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
