defmodule MvpApiWeb.EmanationResidualControllerTest do
  use MvpApiWeb.ConnCase

  alias MvpApi.Environment
  alias MvpApi.Environment.EmanationResidual

  @create_attrs %{
    amount: "120.5",
    environmental_burden: "120.5",
    maximum_admitted_standard: "120.5",
    overload_level: "120.5",
    price: "120.5",
    product_name: "some product_name",
    sale_amount: "120.5",
    um: "some um",
    waste_percentage: "120.5",
    waste_recovery_by_sale: "120.5"
  }
  @update_attrs %{
    amount: "456.7",
    environmental_burden: "456.7",
    maximum_admitted_standard: "456.7",
    overload_level: "456.7",
    price: "456.7",
    product_name: "some updated product_name",
    sale_amount: "456.7",
    um: "some updated um",
    waste_percentage: "456.7",
    waste_recovery_by_sale: "456.7"
  }
  @invalid_attrs %{amount: nil, environmental_burden: nil, maximum_admitted_standard: nil, overload_level: nil, price: nil, product_name: nil, sale_amount: nil, um: nil, waste_percentage: nil, waste_recovery_by_sale: nil}

  def fixture(:emanation_residual) do
    {:ok, emanation_residual} = Environment.create_emanation_residual(@create_attrs)
    emanation_residual
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all emanation_residuals", %{conn: conn} do
      conn = get(conn, Routes.emanation_residual_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create emanation_residual" do
    test "renders emanation_residual when data is valid", %{conn: conn} do
      conn = post(conn, Routes.emanation_residual_path(conn, :create), emanation_residual: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.emanation_residual_path(conn, :show, id))

      assert %{
               "id" => id,
               "amount" => "120.5",
               "environmental_burden" => "120.5",
               "maximum_admitted_standard" => "120.5",
               "overload_level" => "120.5",
               "price" => "120.5",
               "product_name" => "some product_name",
               "sale_amount" => "120.5",
               "um" => "some um",
               "waste_percentage" => "120.5",
               "waste_recovery_by_sale" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.emanation_residual_path(conn, :create), emanation_residual: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update emanation_residual" do
    setup [:create_emanation_residual]

    test "renders emanation_residual when data is valid", %{conn: conn, emanation_residual: %EmanationResidual{id: id} = emanation_residual} do
      conn = put(conn, Routes.emanation_residual_path(conn, :update, emanation_residual), emanation_residual: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.emanation_residual_path(conn, :show, id))

      assert %{
               "id" => id,
               "amount" => "456.7",
               "environmental_burden" => "456.7",
               "maximum_admitted_standard" => "456.7",
               "overload_level" => "456.7",
               "price" => "456.7",
               "product_name" => "some updated product_name",
               "sale_amount" => "456.7",
               "um" => "some updated um",
               "waste_percentage" => "456.7",
               "waste_recovery_by_sale" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, emanation_residual: emanation_residual} do
      conn = put(conn, Routes.emanation_residual_path(conn, :update, emanation_residual), emanation_residual: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete emanation_residual" do
    setup [:create_emanation_residual]

    test "deletes chosen emanation_residual", %{conn: conn, emanation_residual: emanation_residual} do
      conn = delete(conn, Routes.emanation_residual_path(conn, :delete, emanation_residual))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.emanation_residual_path(conn, :show, emanation_residual))
      end
    end
  end

  defp create_emanation_residual(_) do
    emanation_residual = fixture(:emanation_residual)
    %{emanation_residual: emanation_residual}
  end
end
