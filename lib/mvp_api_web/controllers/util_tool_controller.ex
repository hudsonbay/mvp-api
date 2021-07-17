defmodule MvpApiWeb.UtilToolController do
  use MvpApiWeb, :controller

  alias MvpApi.Infrastructure
  alias MvpApi.Infrastructure.UtilTool

  action_fallback MvpApiWeb.FallbackController

  def index(conn, _params) do
    utils_tools = Infrastructure.list_utils_tools()
    render(conn, "index.json", utils_tools: utils_tools)
  end

  def create(conn, %{"util_tool" => util_tool_params}) do
    with {:ok, %UtilTool{} = util_tool} <- Infrastructure.create_util_tool(util_tool_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.util_tool_path(conn, :show, util_tool))
      |> render("show.json", util_tool: util_tool)
    end
  end

  def show(conn, %{"id" => id}) do
    util_tool = Infrastructure.get_util_tool!(id)
    render(conn, "show.json", util_tool: util_tool)
  end

  def update(conn, %{"id" => id, "util_tool" => util_tool_params}) do
    util_tool = Infrastructure.get_util_tool!(id)

    with {:ok, %UtilTool{} = util_tool} <- Infrastructure.update_util_tool(util_tool, util_tool_params) do
      render(conn, "show.json", util_tool: util_tool)
    end
  end

  def delete(conn, %{"id" => id}) do
    util_tool = Infrastructure.get_util_tool!(id)

    with {:ok, %UtilTool{}} <- Infrastructure.delete_util_tool(util_tool) do
      send_resp(conn, :no_content, "")
    end
  end
end
