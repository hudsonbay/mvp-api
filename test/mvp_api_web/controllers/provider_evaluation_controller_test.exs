defmodule MvpApiWeb.ProviderEvaluationControllerTest do
  use MvpApiWeb.ConnCase

  # alias MvpApi.Providers
  # alias MvpApi.Providers.ProviderEvaluation

  # @create_attrs %{
  #   credit: 42,
  #   credit_weighing: 42,
  #   punctuality: 42,
  #   punctuality_weighing: 42,
  #   quality: 42,
  #   quality_weighing: 42,
  #   quantity: 42,
  #   quantity_weighing: 42,
  #   relations: 42,
  #   relations_weighing: 42
  # }
  # @update_attrs %{
  #   credit: 43,
  #   credit_weighing: 43,
  #   punctuality: 43,
  #   punctuality_weighing: 43,
  #   quality: 43,
  #   quality_weighing: 43,
  #   quantity: 43,
  #   quantity_weighing: 43,
  #   relations: 43,
  #   relations_weighing: 43
  # }
  # @invalid_attrs %{
  #   credit: nil,
  #   credit_weighing: nil,
  #   punctuality: nil,
  #   punctuality_weighing: nil,
  #   quality: nil,
  #   quality_weighing: nil,
  #   quantity: nil,
  #   quantity_weighing: nil,
  #   relations: nil,
  #   relations_weighing: nil
  # }

  # def fixture(:provider_evaluation) do
  #   {:ok, provider_evaluation} = Providers.create_provider_evaluation(@create_attrs)
  #   provider_evaluation
  # end

  # setup %{conn: conn} do
  #   {:ok, conn: put_req_header(conn, "accept", "application/json")}
  # end

  # describe "index" do
  #   test "lists all provider_evaluations", %{conn: conn} do
  #     conn = get(conn, Routes.provider_evaluation_path(conn, :index))
  #     assert json_response(conn, 200)["data"] == []
  #   end
  # end

  # describe "create provider_evaluation" do
  #   test "renders provider_evaluation when data is valid", %{conn: conn} do
  #     conn =
  #       post(conn, Routes.provider_evaluation_path(conn, :create),
  #         provider_evaluation: @create_attrs
  #       )

  #     assert %{"id" => id} = json_response(conn, 201)["data"]

  #     conn = get(conn, Routes.provider_evaluation_path(conn, :show, id))

  #     assert %{
  #              "id" => id,
  #              "credit" => 42,
  #              "credit_weighing" => 42,
  #              "punctuality" => 42,
  #              "punctuality_weighing" => 42,
  #              "quality" => 42,
  #              "quality_weighing" => 42,
  #              "quantity" => 42,
  #              "quantity_weighing" => 42,
  #              "relations" => 42,
  #              "relations_weighing" => 42
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{conn: conn} do
  #     conn =
  #       post(conn, Routes.provider_evaluation_path(conn, :create),
  #         provider_evaluation: @invalid_attrs
  #       )

  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  # describe "update provider_evaluation" do
  #   setup [:create_provider_evaluation]

  #   test "renders provider_evaluation when data is valid", %{
  #     conn: conn,
  #     provider_evaluation: %ProviderEvaluation{id: id} = provider_evaluation
  #   } do
  #     conn =
  #       put(conn, Routes.provider_evaluation_path(conn, :update, provider_evaluation),
  #         provider_evaluation: @update_attrs
  #       )

  #     assert %{"id" => ^id} = json_response(conn, 200)["data"]

  #     conn = get(conn, Routes.provider_evaluation_path(conn, :show, id))

  #     assert %{
  #              "id" => id,
  #              "credit" => 43,
  #              "credit_weighing" => 43,
  #              "punctuality" => 43,
  #              "punctuality_weighing" => 43,
  #              "quality" => 43,
  #              "quality_weighing" => 43,
  #              "quantity" => 43,
  #              "quantity_weighing" => 43,
  #              "relations" => 43,
  #              "relations_weighing" => 43
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{
  #     conn: conn,
  #     provider_evaluation: provider_evaluation
  #   } do
  #     conn =
  #       put(conn, Routes.provider_evaluation_path(conn, :update, provider_evaluation),
  #         provider_evaluation: @invalid_attrs
  #       )

  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  # describe "delete provider_evaluation" do
  #   setup [:create_provider_evaluation]

  #   test "deletes chosen provider_evaluation", %{
  #     conn: conn,
  #     provider_evaluation: provider_evaluation
  #   } do
  #     conn = delete(conn, Routes.provider_evaluation_path(conn, :delete, provider_evaluation))
  #     assert response(conn, 204)

  #     assert_error_sent 404, fn ->
  #       get(conn, Routes.provider_evaluation_path(conn, :show, provider_evaluation))
  #     end
  #   end
  # end

  # defp create_provider_evaluation(_) do
  #   provider_evaluation = fixture(:provider_evaluation)
  #   %{provider_evaluation: provider_evaluation}
  # end
end
