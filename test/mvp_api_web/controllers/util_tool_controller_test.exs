defmodule MvpApiWeb.UtilToolControllerTest do
  use MvpApiWeb.ConnCase

  alias MvpApi.Infrastructure
  alias MvpApi.Infrastructure.UtilTool

  @create_attrs %{
    annual_cost: "120.5",
    annual_wear_percentage: "120.5",
    dedication_percentage: "120.5",
    description: "some description",
    price_per_unit: "120.5",
    quantity: "some quantity",
    total_amount: "120.5"
  }
  @update_attrs %{
    annual_cost: "456.7",
    annual_wear_percentage: "456.7",
    dedication_percentage: "456.7",
    description: "some updated description",
    price_per_unit: "456.7",
    quantity: "some updated quantity",
    total_amount: "456.7"
  }
  @invalid_attrs %{annual_cost: nil, annual_wear_percentage: nil, dedication_percentage: nil, description: nil, price_per_unit: nil, quantity: nil, total_amount: nil}

  def fixture(:util_tool) do
    {:ok, util_tool} = Infrastructure.create_util_tool(@create_attrs)
    util_tool
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all utils_tools", %{conn: conn} do
      conn = get(conn, Routes.util_tool_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create util_tool" do
    test "renders util_tool when data is valid", %{conn: conn} do
      conn = post(conn, Routes.util_tool_path(conn, :create), util_tool: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.util_tool_path(conn, :show, id))

      assert %{
               "id" => id,
               "annual_cost" => "120.5",
               "annual_wear_percentage" => "120.5",
               "dedication_percentage" => "120.5",
               "description" => "some description",
               "price_per_unit" => "120.5",
               "quantity" => "some quantity",
               "total_amount" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.util_tool_path(conn, :create), util_tool: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update util_tool" do
    setup [:create_util_tool]

    test "renders util_tool when data is valid", %{conn: conn, util_tool: %UtilTool{id: id} = util_tool} do
      conn = put(conn, Routes.util_tool_path(conn, :update, util_tool), util_tool: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.util_tool_path(conn, :show, id))

      assert %{
               "id" => id,
               "annual_cost" => "456.7",
               "annual_wear_percentage" => "456.7",
               "dedication_percentage" => "456.7",
               "description" => "some updated description",
               "price_per_unit" => "456.7",
               "quantity" => "some updated quantity",
               "total_amount" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, util_tool: util_tool} do
      conn = put(conn, Routes.util_tool_path(conn, :update, util_tool), util_tool: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete util_tool" do
    setup [:create_util_tool]

    test "deletes chosen util_tool", %{conn: conn, util_tool: util_tool} do
      conn = delete(conn, Routes.util_tool_path(conn, :delete, util_tool))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.util_tool_path(conn, :show, util_tool))
      end
    end
  end

  defp create_util_tool(_) do
    util_tool = fixture(:util_tool)
    %{util_tool: util_tool}
  end
end
