defmodule MvpApiWeb.FactorControllerTest do
  use MvpApiWeb.ConnCase

  # alias MvpApi.Client
  # alias MvpApi.Client.Factor

  # @create_attrs %{
  #   name: "Humedad",
  #   value: "120.5",
  #   weighing: "120.5"
  # }
  # @update_attrs %{
  #   name: "Dureza",
  #   value: "456.7",
  #   weighing: "456.7"
  # }
  # @invalid_attrs %{name: nil, value: nil, weighing: nil}

  # def fixture(:factor) do
  #   {:ok, factor} = Client.create_factor(@create_attrs)
  #   factor
  # end

  # setup %{conn: conn} do
  #   {:ok, conn: put_req_header(conn, "accept", "application/json")}
  # end

  # describe "index" do
  #   test "lists all factors", %{conn: conn} do
  #     conn = get(conn, Routes.factor_path(conn, :index))
  #     assert json_response(conn, 200)["data"] == []
  #   end
  # end

  # describe "create factor" do
  #   test "renders factor when data is valid", %{conn: conn} do
  #     conn = post(conn, Routes.factor_path(conn, :create), factor: @create_attrs)
  #     assert %{"id" => id} = json_response(conn, 201)["data"]

  #     conn = get(conn, Routes.factor_path(conn, :show, id))

  #     assert %{
  #              "id" => id,
  #              "name" => "Humedad",
  #              "value" => "120.5",
  #              "weighing" => "120.5"
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{conn: conn} do
  #     conn = post(conn, Routes.factor_path(conn, :create), factor: @invalid_attrs)
  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  # describe "update factor" do
  #   setup [:create_factor]

  #   test "renders factor when data is valid", %{conn: conn, factor: %Factor{id: id} = factor} do
  #     conn = put(conn, Routes.factor_path(conn, :update, factor), factor: @update_attrs)
  #     assert %{"id" => ^id} = json_response(conn, 200)["data"]

  #     conn = get(conn, Routes.factor_path(conn, :show, id))

  #     assert %{
  #              "id" => id,
  #              "name" => "Dureza",
  #              "value" => "456.7",
  #              "weighing" => "456.7"
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{conn: conn, factor: factor} do
  #     conn = put(conn, Routes.factor_path(conn, :update, factor), factor: @invalid_attrs)
  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  # describe "delete factor" do
  #   setup [:create_factor]

  #   test "deletes chosen factor", %{conn: conn, factor: factor} do
  #     conn = delete(conn, Routes.factor_path(conn, :delete, factor))
  #     assert response(conn, 204)

  #     assert_error_sent 404, fn ->
  #       get(conn, Routes.factor_path(conn, :show, factor))
  #     end
  #   end
  # end

  # defp create_factor(_) do
  #   factor = fixture(:factor)
  #   %{factor: factor}
  # end
end
