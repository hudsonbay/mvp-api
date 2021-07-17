defmodule MvpApiWeb.ControlPointController do
  use MvpApiWeb, :controller

  alias MvpApi.Infrastructure
  alias MvpApi.Infrastructure.Metrology.ControlPoint

  action_fallback MvpApiWeb.FallbackController

  def index(conn, _params) do
    control_points = Infrastructure.list_control_points()
    render(conn, "index.json", control_points: control_points)
  end

  def create(conn, %{"control_point" => control_point_params}) do
    with {:ok, %ControlPoint{} = control_point} <-
           Infrastructure.create_control_point(control_point_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.control_point_path(conn, :show, control_point))
      |> render("show.json", control_point: control_point)
    end
  end

  def show(conn, %{"id" => id}) do
    control_point = Infrastructure.get_control_point!(id)
    render(conn, "show.json", control_point: control_point)
  end

  def update(conn, %{"id" => id, "control_point" => control_point_params}) do
    control_point = Infrastructure.get_control_point!(id)

    with {:ok, %ControlPoint{} = control_point} <-
           Infrastructure.update_control_point(control_point, control_point_params) do
      render(conn, "show.json", control_point: control_point)
    end
  end

  def delete(conn, %{"id" => id}) do
    control_point = Infrastructure.get_control_point!(id)

    with {:ok, %ControlPoint{}} <- Infrastructure.delete_control_point(control_point) do
      send_resp(conn, :no_content, "")
    end
  end
end
