defmodule MvpApiWeb.TangibleFixedAssetControllerTest do
  use MvpApiWeb.ConnCase

  # alias MvpApi.Infrastructure
  # alias MvpApi.Infrastructure.TangibleFixedAsset

  # @create_attrs %{
  #   annual_depreciation: "120.5",
  #   classification: "some classification",
  #   dedicated_percentage: "120.5",
  #   depreciation_rate: "120.5",
  #   description: "some description",
  #   inventory_number: "some inventory_number",
  #   purchase_price: "120.5",
  #   quantity: 42,
  #   total_value: "120.5"
  # }
  # @update_attrs %{
  #   annual_depreciation: "456.7",
  #   classification: "some updated classification",
  #   dedicated_percentage: "456.7",
  #   depreciation_rate: "456.7",
  #   description: "some updated description",
  #   inventory_number: "some updated inventory_number",
  #   purchase_price: "456.7",
  #   quantity: 43,
  #   total_value: "456.7"
  # }
  # @invalid_attrs %{
  #   annual_depreciation: nil,
  #   classification: nil,
  #   dedicated_percentage: nil,
  #   depreciation_rate: nil,
  #   description: nil,
  #   inventory_number: nil,
  #   purchase_price: nil,
  #   quantity: nil,
  #   total_value: nil
  # }

  # def fixture(:tangible_fixed_asset) do
  #   {:ok, tangible_fixed_asset} = Infrastructure.create_tangible_fixed_asset(@create_attrs)
  #   tangible_fixed_asset
  # end

  # setup %{conn: conn} do
  #   {:ok, conn: put_req_header(conn, "accept", "application/json")}
  # end

  # describe "index" do
  #   test "lists all tangible_fixed_assets", %{conn: conn} do
  #     conn = get(conn, Routes.tangible_fixed_asset_path(conn, :index))
  #     assert json_response(conn, 200)["data"] == []
  #   end
  # end

  # describe "create tangible_fixed_asset" do
  #   test "renders tangible_fixed_asset when data is valid", %{conn: conn} do
  #     conn =
  #       post(conn, Routes.tangible_fixed_asset_path(conn, :create),
  #         tangible_fixed_asset: @create_attrs
  #       )

  #     assert %{"id" => id} = json_response(conn, 201)["data"]

  #     conn = get(conn, Routes.tangible_fixed_asset_path(conn, :show, id))

  #     assert %{
  #              "id" => id,
  #              "annual_depreciation" => "120.5",
  #              "classification" => "some classification",
  #              "dedicated_percentage" => "120.5",
  #              "depreciation_rate" => "120.5",
  #              "description" => "some description",
  #              "inventory_number" => "some inventory_number",
  #              "purchase_price" => "120.5",
  #              "quantity" => 42,
  #              "total_value" => "120.5"
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{conn: conn} do
  #     conn =
  #       post(conn, Routes.tangible_fixed_asset_path(conn, :create),
  #         tangible_fixed_asset: @invalid_attrs
  #       )

  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  # describe "update tangible_fixed_asset" do
  #   setup [:create_tangible_fixed_asset]

  #   test "renders tangible_fixed_asset when data is valid", %{
  #     conn: conn,
  #     tangible_fixed_asset: %TangibleFixedAsset{id: id} = tangible_fixed_asset
  #   } do
  #     conn =
  #       put(conn, Routes.tangible_fixed_asset_path(conn, :update, tangible_fixed_asset),
  #         tangible_fixed_asset: @update_attrs
  #       )

  #     assert %{"id" => ^id} = json_response(conn, 200)["data"]

  #     conn = get(conn, Routes.tangible_fixed_asset_path(conn, :show, id))

  #     assert %{
  #              "id" => id,
  #              "annual_depreciation" => "456.7",
  #              "classification" => "some updated classification",
  #              "dedicated_percentage" => "456.7",
  #              "depreciation_rate" => "456.7",
  #              "description" => "some updated description",
  #              "inventory_number" => "some updated inventory_number",
  #              "purchase_price" => "456.7",
  #              "quantity" => 43,
  #              "total_value" => "456.7"
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{
  #     conn: conn,
  #     tangible_fixed_asset: tangible_fixed_asset
  #   } do
  #     conn =
  #       put(conn, Routes.tangible_fixed_asset_path(conn, :update, tangible_fixed_asset),
  #         tangible_fixed_asset: @invalid_attrs
  #       )

  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  # describe "delete tangible_fixed_asset" do
  #   setup [:create_tangible_fixed_asset]

  #   test "deletes chosen tangible_fixed_asset", %{
  #     conn: conn,
  #     tangible_fixed_asset: tangible_fixed_asset
  #   } do
  #     conn = delete(conn, Routes.tangible_fixed_asset_path(conn, :delete, tangible_fixed_asset))
  #     assert response(conn, 204)

  #     assert_error_sent 404, fn ->
  #       get(conn, Routes.tangible_fixed_asset_path(conn, :show, tangible_fixed_asset))
  #     end
  #   end
  # end

  # defp create_tangible_fixed_asset(_) do
  #   tangible_fixed_asset = fixture(:tangible_fixed_asset)
  #   %{tangible_fixed_asset: tangible_fixed_asset}
  # end
end
