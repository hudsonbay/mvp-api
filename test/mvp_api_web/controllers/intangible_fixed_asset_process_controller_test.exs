defmodule MvpApiWeb.IntangibleFixedAssetProcessControllerTest do
  use MvpApiWeb.ConnCase

  # alias MvpApi.Knowledge
  # alias MvpApi.Knowledge.IntangibleFixedAssetProcess

  # @create_attrs %{
  #   amount: 42,
  #   annual_amortization: "120.5",
  #   dedicated_percentage: "120.5",
  #   depreciation_rate: "120.5",
  #   initial_value: "120.5"
  # }
  # @update_attrs %{
  #   amount: 43,
  #   annual_amortization: "456.7",
  #   dedicated_percentage: "456.7",
  #   depreciation_rate: "456.7",
  #   initial_value: "456.7"
  # }
  # @invalid_attrs %{
  #   amount: nil,
  #   annual_amortization: nil,
  #   dedicated_percentage: nil,
  #   depreciation_rate: nil,
  #   initial_value: nil
  # }

  # def fixture(:intangible_fixed_asset_process) do
  #   {:ok, intangible_fixed_asset_process} =
  #     Knowledge.create_intangible_fixed_asset_process(@create_attrs)

  #   intangible_fixed_asset_process
  # end

  # setup %{conn: conn} do
  #   {:ok, conn: put_req_header(conn, "accept", "application/json")}
  # end

  # describe "index" do
  #   test "lists all intangible_fixed_assets_processes", %{conn: conn} do
  #     conn = get(conn, Routes.intangible_fixed_asset_process_path(conn, :index))
  #     assert json_response(conn, 200)["data"] == []
  #   end
  # end

  # describe "create intangible_fixed_asset_process" do
  #   test "renders intangible_fixed_asset_process when data is valid", %{conn: conn} do
  #     conn =
  #       post(conn, Routes.intangible_fixed_asset_process_path(conn, :create),
  #         intangible_fixed_asset_process: @create_attrs
  #       )

  #     assert %{"id" => id} = json_response(conn, 201)["data"]

  #     conn = get(conn, Routes.intangible_fixed_asset_process_path(conn, :show, id))

  #     assert %{
  #              "id" => id,
  #              "amount" => 42,
  #              "annual_amortization" => "120.5",
  #              "dedicated_percentage" => "120.5",
  #              "depreciation_rate" => "120.5",
  #              "initial_value" => "120.5"
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{conn: conn} do
  #     conn =
  #       post(conn, Routes.intangible_fixed_asset_process_path(conn, :create),
  #         intangible_fixed_asset_process: @invalid_attrs
  #       )

  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  # describe "update intangible_fixed_asset_process" do
  #   setup [:create_intangible_fixed_asset_process]

  #   test "renders intangible_fixed_asset_process when data is valid", %{
  #     conn: conn,
  #     intangible_fixed_asset_process:
  #       %IntangibleFixedAssetProcess{id: id} = intangible_fixed_asset_process
  #   } do
  #     conn =
  #       put(
  #         conn,
  #         Routes.intangible_fixed_asset_process_path(
  #           conn,
  #           :update,
  #           intangible_fixed_asset_process
  #         ),
  #         intangible_fixed_asset_process: @update_attrs
  #       )

  #     assert %{"id" => ^id} = json_response(conn, 200)["data"]

  #     conn = get(conn, Routes.intangible_fixed_asset_process_path(conn, :show, id))

  #     assert %{
  #              "id" => id,
  #              "amount" => 43,
  #              "annual_amortization" => "456.7",
  #              "dedicated_percentage" => "456.7",
  #              "depreciation_rate" => "456.7",
  #              "initial_value" => "456.7"
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{
  #     conn: conn,
  #     intangible_fixed_asset_process: intangible_fixed_asset_process
  #   } do
  #     conn =
  #       put(
  #         conn,
  #         Routes.intangible_fixed_asset_process_path(
  #           conn,
  #           :update,
  #           intangible_fixed_asset_process
  #         ),
  #         intangible_fixed_asset_process: @invalid_attrs
  #       )

  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  # describe "delete intangible_fixed_asset_process" do
  #   setup [:create_intangible_fixed_asset_process]

  #   test "deletes chosen intangible_fixed_asset_process", %{
  #     conn: conn,
  #     intangible_fixed_asset_process: intangible_fixed_asset_process
  #   } do
  #     conn =
  #       delete(
  #         conn,
  #         Routes.intangible_fixed_asset_process_path(
  #           conn,
  #           :delete,
  #           intangible_fixed_asset_process
  #         )
  #       )

  #     assert response(conn, 204)

  #     assert_error_sent 404, fn ->
  #       get(
  #         conn,
  #         Routes.intangible_fixed_asset_process_path(conn, :show, intangible_fixed_asset_process)
  #       )
  #     end
  #   end
  # end

  # defp create_intangible_fixed_asset_process(_) do
  #   intangible_fixed_asset_process = fixture(:intangible_fixed_asset_process)
  #   %{intangible_fixed_asset_process: intangible_fixed_asset_process}
  # end
end
