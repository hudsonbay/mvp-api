defmodule MvpApiWeb.IntangibleFixedAssetProcessController do
  use MvpApiWeb, :controller

  alias MvpApi.Knowledge
  alias MvpApi.Knowledge.IntangibleFixedAssetProcess

  action_fallback MvpApiWeb.FallbackController

  def index(conn, _params) do
    intangible_fixed_assets_processes = Knowledge.list_intangible_fixed_assets_processes()

    render(conn, "index.json",
      intangible_fixed_assets_processes: intangible_fixed_assets_processes
    )
  end

  def create(conn, %{"intangible_fixed_asset_process" => intangible_fixed_asset_process_params}) do
    with {:ok, %IntangibleFixedAssetProcess{} = intangible_fixed_asset_process} <-
           Knowledge.create_intangible_fixed_asset_process(intangible_fixed_asset_process_params) do
      conn
      |> put_status(:created)
      |> put_resp_header(
        "location",
        Routes.intangible_fixed_asset_process_path(conn, :show, intangible_fixed_asset_process)
      )
      |> render("show.json", intangible_fixed_asset_process: intangible_fixed_asset_process)
    end
  end

  def show(conn, %{"id" => id}) do
    intangible_fixed_asset_process = Knowledge.get_intangible_fixed_asset_process!(id)
    render(conn, "show.json", intangible_fixed_asset_process: intangible_fixed_asset_process)
  end

  def update(conn, %{
        "id" => id,
        "intangible_fixed_asset_process" => intangible_fixed_asset_process_params
      }) do
    intangible_fixed_asset_process = Knowledge.get_intangible_fixed_asset_process!(id)

    with {:ok, %IntangibleFixedAssetProcess{} = intangible_fixed_asset_process} <-
           Knowledge.update_intangible_fixed_asset_process(
             intangible_fixed_asset_process,
             intangible_fixed_asset_process_params
           ) do
      render(conn, "show.json", intangible_fixed_asset_process: intangible_fixed_asset_process)
    end
  end

  def delete(conn, %{"id" => id}) do
    intangible_fixed_asset_process = Knowledge.get_intangible_fixed_asset_process!(id)

    with {:ok, %IntangibleFixedAssetProcess{}} <-
           Knowledge.delete_intangible_fixed_asset_process(intangible_fixed_asset_process) do
      send_resp(conn, :no_content, "")
    end
  end

  def get_intangible_fixed_assets_of_process(conn, %{"process_id" => process_id}) do
    intangible_fixed_assets_processes =
      Knowledge.get_intangible_fixed_assets_of_process(process_id)

    render(conn, "index.json",
      intangible_fixed_assets_processes: intangible_fixed_assets_processes
    )
  end
end
