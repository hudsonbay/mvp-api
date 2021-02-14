defmodule MvpApiWeb.FactorController do
  use MvpApiWeb, :controller

  alias MvpApi.Client
  alias MvpApi.Client.Factor

  action_fallback MvpApiWeb.FallbackController

  def index(conn, %{"product_id" => product_id}) do
    product = Client.get_product!(product_id)
    render(conn, "index.json", factors: product.factors)
  end

  def create(conn, %{"product" => product_id, "factor" => factor_params}) do
    product = Client.get_product!(product_id)

    with {:ok, %Factor{} = factor} <- Client.create_factor(product, factor_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.product_factor_path(conn, :show, product_id, factor))
      |> render("show.json", factor: factor)
    end
  end

  def show(conn, %{"id" => id}) do
    factor = Client.get_factor!(id)
    render(conn, "show.json", factor: factor)
  end

  def update(conn, %{"id" => id, "factor" => factor_params}) do
    factor = Client.get_factor!(id)

    with {:ok, %Factor{} = factor} <- Client.update_factor(factor, factor_params) do
      render(conn, "show.json", factor: factor)
    end
  end

  def delete(conn, %{"id" => id}) do
    factor = Client.get_factor!(id)

    with {:ok, %Factor{}} <- Client.delete_factor(factor) do
      send_resp(conn, :no_content, "")
    end
  end
end
