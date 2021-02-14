defmodule MvpApiWeb.Plugs.AuthAccessPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :mvp_api,
    module: MvpApi.Guardian,
    error_handler: MvpApi.Accounts.ErrorHandlers

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, allow_blank: true
end
