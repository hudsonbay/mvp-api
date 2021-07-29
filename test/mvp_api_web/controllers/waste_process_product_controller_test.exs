defmodule MvpApiWeb.WasteProcessProductControllerTest do
  use MvpApiWeb.ConnCase

  alias MvpApi.Environment
  alias MvpApi.Environment.WasteProcessProduct

  @create_attrs %{
    amount: "120.5",
    environmental_burden: "120.5",
    maximum_admitted_standard: "120.5",
    overload_level: "120.5",
    price: "120.5",
    price_recoveral_percentage: "120.5",
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
    price_recoveral_percentage: "456.7",
    product_name: "some updated product_name",
    sale_amount: "456.7",
    um: "some updated um",
    waste_percentage: "456.7",
    waste_recovery_by_sale: "456.7"
  }
  @invalid_attrs %{amount: nil, environmental_burden: nil, maximum_admitted_standard: nil, overload_level: nil, price: nil, price_recoveral_percentage: nil, product_name: nil, sale_amount: nil, um: nil, waste_percentage: nil, waste_recovery_by_sale: nil}

  def fixture(:waste_process_product) do
    {:ok, waste_process_product} = Environment.create_waste_process_product(@create_attrs)
    waste_process_product
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all waste_process_products", %{conn: conn} do
      conn = get(conn, Routes.waste_process_product_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create waste_process_product" do
    test "renders waste_process_product when data is valid", %{conn: conn} do
      conn = post(conn, Routes.waste_process_product_path(conn, :create), waste_process_product: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.waste_process_product_path(conn, :show, id))

      assert %{
               "id" => id,
               "amount" => "120.5",
               "environmental_burden" => "120.5",
               "maximum_admitted_standard" => "120.5",
               "overload_level" => "120.5",
               "price" => "120.5",
               "price_recoveral_percentage" => "120.5",
               "product_name" => "some product_name",
               "sale_amount" => "120.5",
               "um" => "some um",
               "waste_percentage" => "120.5",
               "waste_recovery_by_sale" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.waste_process_product_path(conn, :create), waste_process_product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update waste_process_product" do
    setup [:create_waste_process_product]

    test "renders waste_process_product when data is valid", %{conn: conn, waste_process_product: %WasteProcessProduct{id: id} = waste_process_product} do
      conn = put(conn, Routes.waste_process_product_path(conn, :update, waste_process_product), waste_process_product: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.waste_process_product_path(conn, :show, id))

      assert %{
               "id" => id,
               "amount" => "456.7",
               "environmental_burden" => "456.7",
               "maximum_admitted_standard" => "456.7",
               "overload_level" => "456.7",
               "price" => "456.7",
               "price_recoveral_percentage" => "456.7",
               "product_name" => "some updated product_name",
               "sale_amount" => "456.7",
               "um" => "some updated um",
               "waste_percentage" => "456.7",
               "waste_recovery_by_sale" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, waste_process_product: waste_process_product} do
      conn = put(conn, Routes.waste_process_product_path(conn, :update, waste_process_product), waste_process_product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete waste_process_product" do
    setup [:create_waste_process_product]

    test "deletes chosen waste_process_product", %{conn: conn, waste_process_product: waste_process_product} do
      conn = delete(conn, Routes.waste_process_product_path(conn, :delete, waste_process_product))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.waste_process_product_path(conn, :show, waste_process_product))
      end
    end
  end

  defp create_waste_process_product(_) do
    waste_process_product = fixture(:waste_process_product)
    %{waste_process_product: waste_process_product}
  end
end
