defmodule MvpApiWeb.TransportationSchemaControllerTest do
  use MvpApiWeb.ConnCase

  alias MvpApi.Providers
  alias MvpApi.Providers.TransportationSchema

  @create_attrs %{
    using_own: "120.5",
    using_provider: "120.5",
    using_third: "120.5"
  }
  @update_attrs %{
    using_own: "456.7",
    using_provider: "456.7",
    using_third: "456.7"
  }
  @invalid_attrs %{using_own: nil, using_provider: nil, using_third: nil}

  def fixture(:transportation_schema) do
    {:ok, transportation_schema} = Providers.create_transportation_schema(@create_attrs)
    transportation_schema
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all transportation_schemas", %{conn: conn} do
      conn = get(conn, Routes.transportation_schema_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create transportation_schema" do
    test "renders transportation_schema when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.transportation_schema_path(conn, :create),
          transportation_schema: @create_attrs
        )

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.transportation_schema_path(conn, :show, id))

      assert %{
               "id" => id,
               "using_own" => "120.5",
               "using_provider" => "120.5",
               "using_third" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.transportation_schema_path(conn, :create),
          transportation_schema: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update transportation_schema" do
    setup [:create_transportation_schema]

    test "renders transportation_schema when data is valid", %{
      conn: conn,
      transportation_schema: %TransportationSchema{id: id} = transportation_schema
    } do
      conn =
        put(conn, Routes.transportation_schema_path(conn, :update, transportation_schema),
          transportation_schema: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.transportation_schema_path(conn, :show, id))

      assert %{
               "id" => id,
               "using_own" => "456.7",
               "using_provider" => "456.7",
               "using_third" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      transportation_schema: transportation_schema
    } do
      conn =
        put(conn, Routes.transportation_schema_path(conn, :update, transportation_schema),
          transportation_schema: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete transportation_schema" do
    setup [:create_transportation_schema]

    test "deletes chosen transportation_schema", %{
      conn: conn,
      transportation_schema: transportation_schema
    } do
      conn = delete(conn, Routes.transportation_schema_path(conn, :delete, transportation_schema))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.transportation_schema_path(conn, :show, transportation_schema))
      end
    end
  end

  defp create_transportation_schema(_) do
    transportation_schema = fixture(:transportation_schema)
    %{transportation_schema: transportation_schema}
  end
end
