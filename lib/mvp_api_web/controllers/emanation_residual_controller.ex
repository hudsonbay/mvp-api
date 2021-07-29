defmodule MvpApiWeb.EmanationResidualController do
  use MvpApiWeb, :controller

  alias MvpApi.Environment
  alias MvpApi.Environment.EmanationResidual

  action_fallback MvpApiWeb.FallbackController

  def index(conn, _params) do
    emanation_residuals = Environment.list_emanation_residuals()
    render(conn, "index.json", emanation_residuals: emanation_residuals)
  end

  def create(conn, %{"emanation_residual" => emanation_residual_params}) do
    with {:ok, %EmanationResidual{} = emanation_residual} <- Environment.create_emanation_residual(emanation_residual_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.emanation_residual_path(conn, :show, emanation_residual))
      |> render("show.json", emanation_residual: emanation_residual)
    end
  end

  def show(conn, %{"id" => id}) do
    emanation_residual = Environment.get_emanation_residual!(id)
    render(conn, "show.json", emanation_residual: emanation_residual)
  end

  def update(conn, %{"id" => id, "emanation_residual" => emanation_residual_params}) do
    emanation_residual = Environment.get_emanation_residual!(id)

    with {:ok, %EmanationResidual{} = emanation_residual} <- Environment.update_emanation_residual(emanation_residual, emanation_residual_params) do
      render(conn, "show.json", emanation_residual: emanation_residual)
    end
  end

  def delete(conn, %{"id" => id}) do
    emanation_residual = Environment.get_emanation_residual!(id)

    with {:ok, %EmanationResidual{}} <- Environment.delete_emanation_residual(emanation_residual) do
      send_resp(conn, :no_content, "")
    end
  end
end
