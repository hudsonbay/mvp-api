defmodule MvpApi.EnvironmentTest do
  use MvpApi.DataCase

  # alias MvpApi.Environment

  # describe "waste_materials" do
  #   alias MvpApi.Environment.WasteMaterials

  #   @valid_attrs %{amount: "120.5", environmental_burden: "120.5", maximum_admitted_standard: "120.5", overload_level: "120.5", price: "120.5", price_recoveral_percentage: "120.5", product_name: "some product_name", sale_amount: "120.5", um: "some um", waste_percentage: "120.5", waste_recovery_by_sale: "120.5"}
  #   @update_attrs %{amount: "456.7", environmental_burden: "456.7", maximum_admitted_standard: "456.7", overload_level: "456.7", price: "456.7", price_recoveral_percentage: "456.7", product_name: "some updated product_name", sale_amount: "456.7", um: "some updated um", waste_percentage: "456.7", waste_recovery_by_sale: "456.7"}
  #   @invalid_attrs %{amount: nil, environmental_burden: nil, maximum_admitted_standard: nil, overload_level: nil, price: nil, price_recoveral_percentage: nil, product_name: nil, sale_amount: nil, um: nil, waste_percentage: nil, waste_recovery_by_sale: nil}

  #   def waste_materials_fixture(attrs \\ %{}) do
  #     {:ok, waste_materials} =
  #       attrs
  #       |> Enum.into(@valid_attrs)
  #       |> Environment.create_waste_materials()

  #     waste_materials
  #   end

  #   test "list_waste_materials/0 returns all waste_materials" do
  #     waste_materials = waste_materials_fixture()
  #     assert Environment.list_waste_materials() == [waste_materials]
  #   end

  #   test "get_waste_materials!/1 returns the waste_materials with given id" do
  #     waste_materials = waste_materials_fixture()
  #     assert Environment.get_waste_materials!(waste_materials.id) == waste_materials
  #   end

  #   test "create_waste_materials/1 with valid data creates a waste_materials" do
  #     assert {:ok, %WasteMaterials{} = waste_materials} = Environment.create_waste_materials(@valid_attrs)
  #     assert waste_materials.amount == Decimal.new("120.5")
  #     assert waste_materials.environmental_burden == Decimal.new("120.5")
  #     assert waste_materials.maximum_admitted_standard == Decimal.new("120.5")
  #     assert waste_materials.overload_level == Decimal.new("120.5")
  #     assert waste_materials.price == Decimal.new("120.5")
  #     assert waste_materials.price_recoveral_percentage == Decimal.new("120.5")
  #     assert waste_materials.product_name == "some product_name"
  #     assert waste_materials.sale_amount == Decimal.new("120.5")
  #     assert waste_materials.um == "some um"
  #     assert waste_materials.waste_percentage == Decimal.new("120.5")
  #     assert waste_materials.waste_recovery_by_sale == Decimal.new("120.5")
  #   end

  #   test "create_waste_materials/1 with invalid data returns error changeset" do
  #     assert {:error, %Ecto.Changeset{}} = Environment.create_waste_materials(@invalid_attrs)
  #   end

  #   test "update_waste_materials/2 with valid data updates the waste_materials" do
  #     waste_materials = waste_materials_fixture()
  #     assert {:ok, %WasteMaterials{} = waste_materials} = Environment.update_waste_materials(waste_materials, @update_attrs)
  #     assert waste_materials.amount == Decimal.new("456.7")
  #     assert waste_materials.environmental_burden == Decimal.new("456.7")
  #     assert waste_materials.maximum_admitted_standard == Decimal.new("456.7")
  #     assert waste_materials.overload_level == Decimal.new("456.7")
  #     assert waste_materials.price == Decimal.new("456.7")
  #     assert waste_materials.price_recoveral_percentage == Decimal.new("456.7")
  #     assert waste_materials.product_name == "some updated product_name"
  #     assert waste_materials.sale_amount == Decimal.new("456.7")
  #     assert waste_materials.um == "some updated um"
  #     assert waste_materials.waste_percentage == Decimal.new("456.7")
  #     assert waste_materials.waste_recovery_by_sale == Decimal.new("456.7")
  #   end

  #   test "update_waste_materials/2 with invalid data returns error changeset" do
  #     waste_materials = waste_materials_fixture()
  #     assert {:error, %Ecto.Changeset{}} = Environment.update_waste_materials(waste_materials, @invalid_attrs)
  #     assert waste_materials == Environment.get_waste_materials!(waste_materials.id)
  #   end

  #   test "delete_waste_materials/1 deletes the waste_materials" do
  #     waste_materials = waste_materials_fixture()
  #     assert {:ok, %WasteMaterials{}} = Environment.delete_waste_materials(waste_materials)
  #     assert_raise Ecto.NoResultsError, fn -> Environment.get_waste_materials!(waste_materials.id) end
  #   end

  #   test "change_waste_materials/1 returns a waste_materials changeset" do
  #     waste_materials = waste_materials_fixture()
  #     assert %Ecto.Changeset{} = Environment.change_waste_materials(waste_materials)
  #   end
  # end
end
