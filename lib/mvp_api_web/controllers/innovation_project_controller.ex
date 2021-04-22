defmodule MvpApiWeb.InnovationProjectController do
  use MvpApiWeb, :controller

  alias MvpApi.Knowledge
  alias MvpApi.Knowledge.InnovationProject

  action_fallback MvpApiWeb.FallbackController

  def index(conn, _params) do
    innovation_projects = Knowledge.list_innovation_projects()
    render(conn, "index.json", innovation_projects: innovation_projects)
  end

  def create(conn, %{"innovation_project" => innovation_project_params}) do
    with {:ok, %InnovationProject{} = innovation_project} <-
           Knowledge.create_innovation_project(innovation_project_params) do
      conn
      |> put_status(:created)
      |> put_resp_header(
        "location",
        Routes.innovation_project_path(conn, :show, innovation_project)
      )
      |> render("show.json", innovation_project: innovation_project)
    end
  end

  def show(conn, %{"id" => id}) do
    innovation_project = Knowledge.get_innovation_project!(id)
    render(conn, "show.json", innovation_project: innovation_project)
  end

  def update(conn, %{"id" => id, "innovation_project" => innovation_project_params}) do
    innovation_project = Knowledge.get_innovation_project!(id)

    with {:ok, %InnovationProject{} = innovation_project} <-
           Knowledge.update_innovation_project(innovation_project, innovation_project_params) do
      render(conn, "show.json", innovation_project: innovation_project)
    end
  end

  def delete(conn, %{"id" => id}) do
    innovation_project = Knowledge.get_innovation_project!(id)

    with {:ok, %InnovationProject{}} <- Knowledge.delete_innovation_project(innovation_project) do
      send_resp(conn, :no_content, "")
    end
  end
end
