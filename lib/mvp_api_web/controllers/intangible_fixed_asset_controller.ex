defmodule MvpApiWeb.IntangibleFixedAssetController do
  use MvpApiWeb, :controller

  alias MvpApi.Knowledge
  alias MvpApi.Knowledge.IntangibleFixedAsset

  action_fallback MvpApiWeb.FallbackController

  def index(conn, _params) do
    intangible_fixed_assets = Knowledge.list_intangible_fixed_assets()
    render(conn, "index.json", intangible_fixed_assets: intangible_fixed_assets)
  end

  def create(conn, %{"intangible_fixed_asset" => intangible_fixed_asset_params}) do
    with {:ok, %IntangibleFixedAsset{} = intangible_fixed_asset} <- Knowledge.create_intangible_fixed_asset(intangible_fixed_asset_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.intangible_fixed_asset_path(conn, :show, intangible_fixed_asset))
      |> render("show.json", intangible_fixed_asset: intangible_fixed_asset)
    end
  end

  def show(conn, %{"id" => id}) do
    intangible_fixed_asset = Knowledge.get_intangible_fixed_asset!(id)
    render(conn, "show.json", intangible_fixed_asset: intangible_fixed_asset)
  end

  def update(conn, %{"id" => id, "intangible_fixed_asset" => intangible_fixed_asset_params}) do
    intangible_fixed_asset = Knowledge.get_intangible_fixed_asset!(id)

    with {:ok, %IntangibleFixedAsset{} = intangible_fixed_asset} <- Knowledge.update_intangible_fixed_asset(intangible_fixed_asset, intangible_fixed_asset_params) do
      render(conn, "show.json", intangible_fixed_asset: intangible_fixed_asset)
    end
  end

  def delete(conn, %{"id" => id}) do
    intangible_fixed_asset = Knowledge.get_intangible_fixed_asset!(id)

    with {:ok, %IntangibleFixedAsset{}} <- Knowledge.delete_intangible_fixed_asset(intangible_fixed_asset) do
      send_resp(conn, :no_content, "")
    end
  end
end
