import Config

if config_env() == :prod do
  secret_key_base = "iy8zXCj/z2kOz9QAriICX5L0veOe/JpdRVeWJYAL3wBXBZK5aplrHNSqqk1mmJ8h"

  # app_name =
  #   System.get_env("FLY_APP_NAME") ||
  #     "mvp_api"

  config :mvp_api, MvpApiWeb.Endpoint,
    server: true,
    # url: [host: "#{app_name}.fly.dev", port: 80],
    http: [
      port: String.to_integer(System.get_env("PORT") || "4000"),
      # IMPORTANT: support IPv6 addresses
      transport_options: [socket_opts: [:inet6]]
    ],
    secret_key_base: secret_key_base,
    check_origin: false

  database_url = "ecto://postgres:postgres@localhost/mvp_api"

  config :mvp_api, MvpApi.Repo,
    url: database_url,
    # IMPORTANT: Or it won't find the DB server
    socket_options: [:inet6],
    pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")
end
