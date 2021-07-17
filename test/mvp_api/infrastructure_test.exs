# mix test test/mvp_api/infrastructure_test.exs

defmodule MvpApi.InfrastructureTest do
  use MvpApi.DataCase

  alias MvpApi.Infrastructure

  describe "tangible_fixed_assets" do
    alias MvpApi.Infrastructure.TangibleFixedAsset

    @valid_attrs %{
      classification: "some classification",
      dedicated_percentage: "100",
      depreciation_rate: Decimal.new(6),
      description: "some description",
      inventory_number: "some inventory_number",
      purchase_price: Money.new(:CUP, Decimal.from_float(35_500.3)),
      quantity: 30,
    }
    @update_attrs %{
      classification: "some updated classification",
      dedicated_percentage: "20",
      depreciation_rate: "456.7",
      description: "some updated description",
      inventory_number: "some updated inventory_number",
      purchase_price: Money.new(:CUP, 456.7),
      quantity: 43,
    }
    @invalid_attrs %{
      classification: nil,
      dedicated_percentage: nil,
      depreciation_rate: nil,
      description: nil,
      inventory_number: nil,
      purchase_price: nil,
      quantity: nil,
    }

    def tangible_fixed_asset_fixture(attrs \\ %{}) do
      {:ok, tangible_fixed_asset} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Infrastructure.create_tangible_fixed_asset()

      tangible_fixed_asset
    end

    test "list_tangible_fixed_assets/0 returns all tangible_fixed_assets" do
      tangible_fixed_asset = tangible_fixed_asset_fixture()
      assert Infrastructure.list_tangible_fixed_assets() == [tangible_fixed_asset]
    end

    test "get_tangible_fixed_asset!/1 returns the tangible_fixed_asset with given id" do
      tangible_fixed_asset = tangible_fixed_asset_fixture()

      assert Infrastructure.get_tangible_fixed_asset!(tangible_fixed_asset.id) ==
               tangible_fixed_asset
    end

    test "create_tangible_fixed_asset/1 with valid data creates a tangible_fixed_asset" do
      assert {:ok, %TangibleFixedAsset{} = tangible_fixed_asset} =
               Infrastructure.create_tangible_fixed_asset(@valid_attrs)

      assert tangible_fixed_asset.annual_depreciation == Money.new(:CUP, Decimal.from_float(639005.4))
      assert tangible_fixed_asset.classification == "some classification"
      assert tangible_fixed_asset.dedicated_percentage == Decimal.new(100)
      assert tangible_fixed_asset.depreciation_rate == Decimal.new(6)
      assert tangible_fixed_asset.description == "some description"
      assert tangible_fixed_asset.inventory_number == "some inventory_number"
      assert tangible_fixed_asset.purchase_price == Money.new(:CUP, Decimal.from_float(35_500.3))
      assert tangible_fixed_asset.quantity == 30
      assert tangible_fixed_asset.total_value == Money.new(:CUP, Decimal.from_float(1_065_009.0))
    end

    # test "create_tangible_fixed_asset/1 with invalid data returns error changeset" do
    #   assert {:error, %Ecto.Changeset{}} =
    #            Infrastructure.create_tangible_fixed_asset(@invalid_attrs)
    # end

  #   test "update_tangible_fixed_asset/2 with valid data updates the tangible_fixed_asset" do
  #     tangible_fixed_asset = tangible_fixed_asset_fixture()

  #     assert {:ok, %TangibleFixedAsset{} = tangible_fixed_asset} =
  #              Infrastructure.update_tangible_fixed_asset(tangible_fixed_asset, @update_attrs)

  #     assert tangible_fixed_asset.annual_depreciation == Decimal.new("456.7")
  #     assert tangible_fixed_asset.classification == "some updated classification"
  #     assert tangible_fixed_asset.dedicated_percentage == Decimal.new("456.7")
  #     assert tangible_fixed_asset.depreciation_rate == Decimal.new("456.7")
  #     assert tangible_fixed_asset.description == "some updated description"
  #     assert tangible_fixed_asset.inventory_number == "some updated inventory_number"
  #     assert tangible_fixed_asset.purchase_price == Decimal.new("456.7")
  #     assert tangible_fixed_asset.quantity == 43
  #     assert tangible_fixed_asset.total_value == Decimal.new("456.7")
  #   end

  #   test "update_tangible_fixed_asset/2 with invalid data returns error changeset" do
  #     tangible_fixed_asset = tangible_fixed_asset_fixture()

  #     assert {:error, %Ecto.Changeset{}} =
  #              Infrastructure.update_tangible_fixed_asset(tangible_fixed_asset, @invalid_attrs)

  #     assert tangible_fixed_asset ==
  #              Infrastructure.get_tangible_fixed_asset!(tangible_fixed_asset.id)
  #   end

    test "delete_tangible_fixed_asset/1 deletes the tangible_fixed_asset" do
      tangible_fixed_asset = tangible_fixed_asset_fixture()

      assert {:ok, %TangibleFixedAsset{}} =
               Infrastructure.delete_tangible_fixed_asset(tangible_fixed_asset)

      assert_raise Ecto.NoResultsError, fn ->
        Infrastructure.get_tangible_fixed_asset!(tangible_fixed_asset.id)
      end
    end

    test "change_tangible_fixed_asset/1 returns a tangible_fixed_asset changeset" do
      tangible_fixed_asset = tangible_fixed_asset_fixture()
      assert %Ecto.Changeset{} = Infrastructure.change_tangible_fixed_asset(tangible_fixed_asset)
    end
  end

  describe "utils_tools" do
    alias MvpApi.Infrastructure.UtilTool

    @valid_attrs %{annual_cost: "120.5", annual_wear_percentage: "120.5", dedication_percentage: "120.5", description: "some description", price_per_unit: "120.5", quantity: "some quantity", total_amount: "120.5"}
    @update_attrs %{annual_cost: "456.7", annual_wear_percentage: "456.7", dedication_percentage: "456.7", description: "some updated description", price_per_unit: "456.7", quantity: "some updated quantity", total_amount: "456.7"}
    @invalid_attrs %{annual_cost: nil, annual_wear_percentage: nil, dedication_percentage: nil, description: nil, price_per_unit: nil, quantity: nil, total_amount: nil}

    def util_tool_fixture(attrs \\ %{}) do
      {:ok, util_tool} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Infrastructure.create_util_tool()

      util_tool
    end

    test "list_utils_tools/0 returns all utils_tools" do
      util_tool = util_tool_fixture()
      assert Infrastructure.list_utils_tools() == [util_tool]
    end

    test "get_util_tool!/1 returns the util_tool with given id" do
      util_tool = util_tool_fixture()
      assert Infrastructure.get_util_tool!(util_tool.id) == util_tool
    end

    test "create_util_tool/1 with valid data creates a util_tool" do
      assert {:ok, %UtilTool{} = util_tool} = Infrastructure.create_util_tool(@valid_attrs)
      assert util_tool.annual_cost == Decimal.new("120.5")
      assert util_tool.annual_wear_percentage == Decimal.new("120.5")
      assert util_tool.dedication_percentage == Decimal.new("120.5")
      assert util_tool.description == "some description"
      assert util_tool.price_per_unit == Decimal.new("120.5")
      assert util_tool.quantity == "some quantity"
      assert util_tool.total_amount == Decimal.new("120.5")
    end

    test "create_util_tool/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Infrastructure.create_util_tool(@invalid_attrs)
    end

    test "update_util_tool/2 with valid data updates the util_tool" do
      util_tool = util_tool_fixture()
      assert {:ok, %UtilTool{} = util_tool} = Infrastructure.update_util_tool(util_tool, @update_attrs)
      assert util_tool.annual_cost == Decimal.new("456.7")
      assert util_tool.annual_wear_percentage == Decimal.new("456.7")
      assert util_tool.dedication_percentage == Decimal.new("456.7")
      assert util_tool.description == "some updated description"
      assert util_tool.price_per_unit == Decimal.new("456.7")
      assert util_tool.quantity == "some updated quantity"
      assert util_tool.total_amount == Decimal.new("456.7")
    end

    test "update_util_tool/2 with invalid data returns error changeset" do
      util_tool = util_tool_fixture()
      assert {:error, %Ecto.Changeset{}} = Infrastructure.update_util_tool(util_tool, @invalid_attrs)
      assert util_tool == Infrastructure.get_util_tool!(util_tool.id)
    end

    test "delete_util_tool/1 deletes the util_tool" do
      util_tool = util_tool_fixture()
      assert {:ok, %UtilTool{}} = Infrastructure.delete_util_tool(util_tool)
      assert_raise Ecto.NoResultsError, fn -> Infrastructure.get_util_tool!(util_tool.id) end
    end

    test "change_util_tool/1 returns a util_tool changeset" do
      util_tool = util_tool_fixture()
      assert %Ecto.Changeset{} = Infrastructure.change_util_tool(util_tool)
    end
  end
end
