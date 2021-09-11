defmodule MvpApi.Repo do
  use Ecto.Repo,
    otp_app: :mvp_api,
    adapter: Ecto.Adapters.Postgres
end
