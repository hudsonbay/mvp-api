defmodule MvpApiWeb.ActionController do
  use MvpApiWeb, :controller

  alias MvpApi.Infrastructure
  alias MvpApi.Infrastructure.Protection.Action

  action_fallback MvpApiWeb.FallbackController

  def index(conn, _params) do
    protection_actions = Infrastructure.list_protection_actions()
    render(conn, "index.json", protection_actions: protection_actions)
  end

  def create(conn, %{"action" => action_params}) do
    with {:ok, %Action{} = action} <- Infrastructure.create_action(action_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.action_path(conn, :show, action))
      |> render("show.json", action: action)
    end
  end

  def show(conn, %{"id" => id}) do
    action = Infrastructure.get_action!(id)
    render(conn, "show.json", action: action)
  end

  def update(conn, %{"id" => id, "action" => action_params}) do
    action = Infrastructure.get_action!(id)

    with {:ok, %Action{} = action} <- Infrastructure.update_action(action, action_params) do
      render(conn, "show.json", action: action)
    end
  end

  def delete(conn, %{"id" => id}) do
    action = Infrastructure.get_action!(id)

    with {:ok, %Action{}} <- Infrastructure.delete_action(action) do
      send_resp(conn, :no_content, "")
    end
  end
end
