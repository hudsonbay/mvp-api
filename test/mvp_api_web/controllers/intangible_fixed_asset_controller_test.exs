defmodule MvpApiWeb.IntangibleFixedAssetControllerTest do
  use MvpApiWeb.ConnCase

  alias MvpApi.Knowledge
  alias MvpApi.Knowledge.IntangibleFixedAsset

  @create_attrs %{
    description: "some description",
    name: "some name"
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name"
  }
  @invalid_attrs %{description: nil, name: nil}

  def fixture(:intangible_fixed_asset) do
    {:ok, intangible_fixed_asset} = Knowledge.create_intangible_fixed_asset(@create_attrs)
    intangible_fixed_asset
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all intangible_fixed_assets", %{conn: conn} do
      conn = get(conn, Routes.intangible_fixed_asset_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create intangible_fixed_asset" do
    test "renders intangible_fixed_asset when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.intangible_fixed_asset_path(conn, :create),
          intangible_fixed_asset: @create_attrs
        )

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.intangible_fixed_asset_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.intangible_fixed_asset_path(conn, :create),
          intangible_fixed_asset: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update intangible_fixed_asset" do
    setup [:create_intangible_fixed_asset]

    test "renders intangible_fixed_asset when data is valid", %{
      conn: conn,
      intangible_fixed_asset: %IntangibleFixedAsset{id: id} = intangible_fixed_asset
    } do
      conn =
        put(conn, Routes.intangible_fixed_asset_path(conn, :update, intangible_fixed_asset),
          intangible_fixed_asset: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.intangible_fixed_asset_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      intangible_fixed_asset: intangible_fixed_asset
    } do
      conn =
        put(conn, Routes.intangible_fixed_asset_path(conn, :update, intangible_fixed_asset),
          intangible_fixed_asset: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete intangible_fixed_asset" do
    setup [:create_intangible_fixed_asset]

    test "deletes chosen intangible_fixed_asset", %{
      conn: conn,
      intangible_fixed_asset: intangible_fixed_asset
    } do
      conn =
        delete(conn, Routes.intangible_fixed_asset_path(conn, :delete, intangible_fixed_asset))

      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.intangible_fixed_asset_path(conn, :show, intangible_fixed_asset))
      end
    end
  end

  defp create_intangible_fixed_asset(_) do
    intangible_fixed_asset = fixture(:intangible_fixed_asset)
    %{intangible_fixed_asset: intangible_fixed_asset}
  end
end
