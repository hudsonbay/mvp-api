defmodule MvpApiWeb.ProviderController do
  use MvpApiWeb, :controller

  alias MvpApi.Providers
  alias MvpApi.Providers.Provider

  action_fallback MvpApiWeb.FallbackController

  def index(conn, _params) do
    providers = Providers.list_providers()
    render(conn, "index.json", providers: providers)
  end

  def create(conn, %{"provider" => provider_params}) do
    with {:ok, %Provider{} = provider} <- Providers.create_provider(provider_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.provider_path(conn, :show, provider))
      |> render("show.json", provider: provider)
    end
  end

  def show(conn, %{"id" => id}) do
    provider = Providers.get_provider!(id)
    render(conn, "show.json", provider: provider)
  end

  def update(conn, %{"id" => id, "provider" => provider_params}) do
    provider = Providers.get_provider!(id)

    with {:ok, %Provider{} = provider} <- Providers.update_provider(provider, provider_params) do
      render(conn, "show.json", provider: provider)
    end
  end

  def delete(conn, %{"id" => id}) do
    provider = Providers.get_provider!(id)

    with {:ok, %Provider{}} <- Providers.delete_provider(provider) do
      send_resp(conn, :no_content, "")
    end
  end
end
