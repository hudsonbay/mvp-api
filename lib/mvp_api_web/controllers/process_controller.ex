defmodule MvpApiWeb.ProcessController do
  use MvpApiWeb, :controller

  alias MvpApi.Processes
  alias MvpApi.Processes.Process

  action_fallback MvpApiWeb.FallbackController

  def index(conn, _params) do
    processes = Processes.list_processes()
    render(conn, "index.json", processes: processes)
  end

  def create(conn, %{"process" => process_params}) do
    with {:ok, %Process{} = process} <- Processes.create_process(process_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.process_path(conn, :show, process))
      |> render("show.json", process: process)
    end
  end

  def show(conn, %{"id" => id}) do
    process = Processes.get_process!(id)
    render(conn, "show.json", process: process)
  end

  def update(conn, %{"id" => id, "process" => process_params}) do
    process = Processes.get_process!(id)

    with {:ok, %Process{} = process} <- Processes.update_process(process, process_params) do
      render(conn, "show.json", process: process)
    end
  end

  def delete(conn, %{"id" => id}) do
    process = Processes.get_process!(id)

    with {:ok, %Process{}} <- Processes.delete_process(process) do
      send_resp(conn, :no_content, "")
    end
  end

end
