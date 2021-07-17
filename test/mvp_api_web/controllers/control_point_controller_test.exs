defmodule MvpApiWeb.ControlPointControllerTest do
  use MvpApiWeb.ConnCase

  alias MvpApi.Infrastructure
  alias MvpApi.Infrastructure.Metrology.ControlPoint

  @create_attrs %{
    annual_cost_verification: "120.5",
    annual_total_expense: "120.5",
    dedicated_percentage: "120.5",
    executor: "some executor",
    instrument: "some instrument",
    name: "some name",
    precision: "some precision",
    price_per_unit: "120.5",
    price_per_verification: "120.5",
    quantity: "some quantity",
    total_amount: "120.5",
    useful_life_years: 42,
    variable_to_control: "some variable_to_control",
    verification_frequency_months: 42
  }
  @update_attrs %{
    annual_cost_verification: "456.7",
    annual_total_expense: "456.7",
    dedicated_percentage: "456.7",
    executor: "some updated executor",
    instrument: "some updated instrument",
    name: "some updated name",
    precision: "some updated precision",
    price_per_unit: "456.7",
    price_per_verification: "456.7",
    quantity: "some updated quantity",
    total_amount: "456.7",
    useful_life_years: 43,
    variable_to_control: "some updated variable_to_control",
    verification_frequency_months: 43
  }
  @invalid_attrs %{
    annual_cost_verification: nil,
    annual_total_expense: nil,
    dedicated_percentage: nil,
    executor: nil,
    instrument: nil,
    name: nil,
    precision: nil,
    price_per_unit: nil,
    price_per_verification: nil,
    quantity: nil,
    total_amount: nil,
    useful_life_years: nil,
    variable_to_control: nil,
    verification_frequency_months: nil
  }

  def fixture(:control_point) do
    {:ok, control_point} = Infrastructure.create_control_point(@create_attrs)
    control_point
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all control_points", %{conn: conn} do
      conn = get(conn, Routes.control_point_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create control_point" do
    test "renders control_point when data is valid", %{conn: conn} do
      conn = post(conn, Routes.control_point_path(conn, :create), control_point: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.control_point_path(conn, :show, id))

      assert %{
               "id" => id,
               "annual_cost_verification" => "120.5",
               "annual_total_expense" => "120.5",
               "dedicated_percentage" => "120.5",
               "executor" => "some executor",
               "instrument" => "some instrument",
               "name" => "some name",
               "precision" => "some precision",
               "price_per_unit" => "120.5",
               "price_per_verification" => "120.5",
               "quantity" => "some quantity",
               "total_amount" => "120.5",
               "useful_life_years" => 42,
               "variable_to_control" => "some variable_to_control",
               "verification_frequency_months" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.control_point_path(conn, :create), control_point: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update control_point" do
    setup [:create_control_point]

    test "renders control_point when data is valid", %{
      conn: conn,
      control_point: %ControlPoint{id: id} = control_point
    } do
      conn =
        put(conn, Routes.control_point_path(conn, :update, control_point),
          control_point: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.control_point_path(conn, :show, id))

      assert %{
               "id" => id,
               "annual_cost_verification" => "456.7",
               "annual_total_expense" => "456.7",
               "dedicated_percentage" => "456.7",
               "executor" => "some updated executor",
               "instrument" => "some updated instrument",
               "name" => "some updated name",
               "precision" => "some updated precision",
               "price_per_unit" => "456.7",
               "price_per_verification" => "456.7",
               "quantity" => "some updated quantity",
               "total_amount" => "456.7",
               "useful_life_years" => 43,
               "variable_to_control" => "some updated variable_to_control",
               "verification_frequency_months" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, control_point: control_point} do
      conn =
        put(conn, Routes.control_point_path(conn, :update, control_point),
          control_point: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete control_point" do
    setup [:create_control_point]

    test "deletes chosen control_point", %{conn: conn, control_point: control_point} do
      conn = delete(conn, Routes.control_point_path(conn, :delete, control_point))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.control_point_path(conn, :show, control_point))
      end
    end
  end

  defp create_control_point(_) do
    control_point = fixture(:control_point)
    %{control_point: control_point}
  end
end
