defmodule MvpApiWeb.WasteMaterialsController do
  use MvpApiWeb, :controller

  alias MvpApi.Environment
  alias MvpApi.Environment.WasteMaterials

  action_fallback MvpApiWeb.FallbackController

  def index(conn, _params) do
    waste_materials = Environment.list_waste_materials()
    render(conn, "index.json", waste_materials: waste_materials)
  end

  def create(conn, %{"waste_materials" => waste_materials_params}) do
    with {:ok, %WasteMaterials{} = waste_materials} <- Environment.create_waste_materials(waste_materials_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.waste_materials_path(conn, :show, waste_materials))
      |> render("show.json", waste_materials: waste_materials)
    end
  end

  def show(conn, %{"id" => id}) do
    waste_materials = Environment.get_waste_materials!(id)
    render(conn, "show.json", waste_materials: waste_materials)
  end

  def update(conn, %{"id" => id, "waste_materials" => waste_materials_params}) do
    waste_materials = Environment.get_waste_materials!(id)

    with {:ok, %WasteMaterials{} = waste_materials} <- Environment.update_waste_materials(waste_materials, waste_materials_params) do
      render(conn, "show.json", waste_materials: waste_materials)
    end
  end

  def delete(conn, %{"id" => id}) do
    waste_materials = Environment.get_waste_materials!(id)

    with {:ok, %WasteMaterials{}} <- Environment.delete_waste_materials(waste_materials) do
      send_resp(conn, :no_content, "")
    end
  end
end
