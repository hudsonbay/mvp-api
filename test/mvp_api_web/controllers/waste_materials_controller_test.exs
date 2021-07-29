defmodule MvpApiWeb.WasteMaterialsControllerTest do
  use MvpApiWeb.ConnCase

  # alias MvpApi.Environment
  # alias MvpApi.Environment.WasteMaterials

  # @create_attrs %{
  #   amount: "120.5",
  #   environmental_burden: "120.5",
  #   maximum_admitted_standard: "120.5",
  #   overload_level: "120.5",
  #   price: "120.5",
  #   price_recoveral_percentage: "120.5",
  #   product_name: "some product_name",
  #   sale_amount: "120.5",
  #   um: "some um",
  #   waste_percentage: "120.5",
  #   waste_recovery_by_sale: "120.5"
  # }
  # @update_attrs %{
  #   amount: "456.7",
  #   environmental_burden: "456.7",
  #   maximum_admitted_standard: "456.7",
  #   overload_level: "456.7",
  #   price: "456.7",
  #   price_recoveral_percentage: "456.7",
  #   product_name: "some updated product_name",
  #   sale_amount: "456.7",
  #   um: "some updated um",
  #   waste_percentage: "456.7",
  #   waste_recovery_by_sale: "456.7"
  # }
  # @invalid_attrs %{amount: nil, environmental_burden: nil, maximum_admitted_standard: nil, overload_level: nil, price: nil, price_recoveral_percentage: nil, product_name: nil, sale_amount: nil, um: nil, waste_percentage: nil, waste_recovery_by_sale: nil}

  # def fixture(:waste_materials) do
  #   {:ok, waste_materials} = Environment.create_waste_materials(@create_attrs)
  #   waste_materials
  # end

  # setup %{conn: conn} do
  #   {:ok, conn: put_req_header(conn, "accept", "application/json")}
  # end

  # describe "index" do
  #   test "lists all waste_materials", %{conn: conn} do
  #     conn = get(conn, Routes.waste_materials_path(conn, :index))
  #     assert json_response(conn, 200)["data"] == []
  #   end
  # end

  # describe "create waste_materials" do
  #   test "renders waste_materials when data is valid", %{conn: conn} do
  #     conn = post(conn, Routes.waste_materials_path(conn, :create), waste_materials: @create_attrs)
  #     assert %{"id" => id} = json_response(conn, 201)["data"]

  #     conn = get(conn, Routes.waste_materials_path(conn, :show, id))

  #     assert %{
  #              "id" => id,
  #              "amount" => "120.5",
  #              "environmental_burden" => "120.5",
  #              "maximum_admitted_standard" => "120.5",
  #              "overload_level" => "120.5",
  #              "price" => "120.5",
  #              "price_recoveral_percentage" => "120.5",
  #              "product_name" => "some product_name",
  #              "sale_amount" => "120.5",
  #              "um" => "some um",
  #              "waste_percentage" => "120.5",
  #              "waste_recovery_by_sale" => "120.5"
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{conn: conn} do
  #     conn = post(conn, Routes.waste_materials_path(conn, :create), waste_materials: @invalid_attrs)
  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  # describe "update waste_materials" do
  #   setup [:create_waste_materials]

  #   test "renders waste_materials when data is valid", %{conn: conn, waste_materials: %WasteMaterials{id: id} = waste_materials} do
  #     conn = put(conn, Routes.waste_materials_path(conn, :update, waste_materials), waste_materials: @update_attrs)
  #     assert %{"id" => ^id} = json_response(conn, 200)["data"]

  #     conn = get(conn, Routes.waste_materials_path(conn, :show, id))

  #     assert %{
  #              "id" => id,
  #              "amount" => "456.7",
  #              "environmental_burden" => "456.7",
  #              "maximum_admitted_standard" => "456.7",
  #              "overload_level" => "456.7",
  #              "price" => "456.7",
  #              "price_recoveral_percentage" => "456.7",
  #              "product_name" => "some updated product_name",
  #              "sale_amount" => "456.7",
  #              "um" => "some updated um",
  #              "waste_percentage" => "456.7",
  #              "waste_recovery_by_sale" => "456.7"
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{conn: conn, waste_materials: waste_materials} do
  #     conn = put(conn, Routes.waste_materials_path(conn, :update, waste_materials), waste_materials: @invalid_attrs)
  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  # describe "delete waste_materials" do
  #   setup [:create_waste_materials]

  #   test "deletes chosen waste_materials", %{conn: conn, waste_materials: waste_materials} do
  #     conn = delete(conn, Routes.waste_materials_path(conn, :delete, waste_materials))
  #     assert response(conn, 204)

  #     assert_error_sent 404, fn ->
  #       get(conn, Routes.waste_materials_path(conn, :show, waste_materials))
  #     end
  #   end
  # end

  # defp create_waste_materials(_) do
  #   waste_materials = fixture(:waste_materials)
  #   %{waste_materials: waste_materials}
  # end
end
