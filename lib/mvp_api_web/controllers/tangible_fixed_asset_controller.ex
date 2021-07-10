defmodule MvpApiWeb.TangibleFixedAssetController do
  use MvpApiWeb, :controller

  alias MvpApi.Infrastructure
  alias MvpApi.Infrastructure.TangibleFixedAsset

  action_fallback MvpApiWeb.FallbackController

  def index(conn, _params) do
    tangible_fixed_assets = Infrastructure.list_tangible_fixed_assets()
    render(conn, "index.json", tangible_fixed_assets: tangible_fixed_assets)
  end

  def create(conn, %{"tangible_fixed_asset" => tangible_fixed_asset_params}) do
    with {:ok, %TangibleFixedAsset{} = tangible_fixed_asset} <-
           Infrastructure.create_tangible_fixed_asset(tangible_fixed_asset_params) do
      conn
      |> put_status(:created)
      |> put_resp_header(
        "location",
        Routes.tangible_fixed_asset_path(conn, :show, tangible_fixed_asset)
      )
      |> render("show.json", tangible_fixed_asset: tangible_fixed_asset)
    end
  end

  def show(conn, %{"id" => id}) do
    tangible_fixed_asset = Infrastructure.get_tangible_fixed_asset!(id)
    render(conn, "show.json", tangible_fixed_asset: tangible_fixed_asset)
  end

  def update(conn, %{"id" => id, "tangible_fixed_asset" => tangible_fixed_asset_params}) do
    tangible_fixed_asset = Infrastructure.get_tangible_fixed_asset!(id)

    with {:ok, %TangibleFixedAsset{} = tangible_fixed_asset} <-
           Infrastructure.update_tangible_fixed_asset(
             tangible_fixed_asset,
             tangible_fixed_asset_params
           ) do
      render(conn, "show.json", tangible_fixed_asset: tangible_fixed_asset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tangible_fixed_asset = Infrastructure.get_tangible_fixed_asset!(id)

    with {:ok, %TangibleFixedAsset{}} <-
           Infrastructure.delete_tangible_fixed_asset(tangible_fixed_asset) do
      send_resp(conn, :no_content, "")
    end
  end
end
