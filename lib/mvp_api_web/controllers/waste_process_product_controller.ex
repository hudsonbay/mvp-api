defmodule MvpApiWeb.WasteProcessProductController do
  use MvpApiWeb, :controller

  alias MvpApi.Environment
  alias MvpApi.Environment.WasteProcessProduct

  action_fallback MvpApiWeb.FallbackController

  def index(conn, _params) do
    waste_process_products = Environment.list_waste_process_products()
    render(conn, "index.json", waste_process_products: waste_process_products)
  end

  def create(conn, %{"waste_process_product" => waste_process_product_params}) do
    with {:ok, %WasteProcessProduct{} = waste_process_product} <- Environment.create_waste_process_product(waste_process_product_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.waste_process_product_path(conn, :show, waste_process_product))
      |> render("show.json", waste_process_product: waste_process_product)
    end
  end

  def show(conn, %{"id" => id}) do
    waste_process_product = Environment.get_waste_process_product!(id)
    render(conn, "show.json", waste_process_product: waste_process_product)
  end

  def update(conn, %{"id" => id, "waste_process_product" => waste_process_product_params}) do
    waste_process_product = Environment.get_waste_process_product!(id)

    with {:ok, %WasteProcessProduct{} = waste_process_product} <- Environment.update_waste_process_product(waste_process_product, waste_process_product_params) do
      render(conn, "show.json", waste_process_product: waste_process_product)
    end
  end

  def delete(conn, %{"id" => id}) do
    waste_process_product = Environment.get_waste_process_product!(id)

    with {:ok, %WasteProcessProduct{}} <- Environment.delete_waste_process_product(waste_process_product) do
      send_resp(conn, :no_content, "")
    end
  end
end
