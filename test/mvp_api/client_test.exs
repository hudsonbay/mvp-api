defmodule MvpApi.ClientTest do
  use MvpApi.DataCase

  # alias MvpApi.Client

  # describe "products" do
    # alias MvpApi.Client.Product

    # @valid_attrs %{name: "some name"}
    # @update_attrs %{name: "some updated name"}
    # @invalid_attrs %{name: nil}

    # def product_fixture(attrs \\ %{}) do
    #   {:ok, product} =
    #     attrs
    #     |> Enum.into(@valid_attrs)
    #     |> Client.create_product()

    #   product
    # end

    # test "list_products/0 returns all products" do
    #   product = product_fixture()
    #   assert Client.list_products() == [product]
    # end

    # test "get_product!/1 returns the product with given id" do
    #   product = product_fixture()
    #   assert Client.get_product!(product.id) == product
    # end

    # test "create_product/1 with valid data creates a product" do
    #   assert {:ok, %Product{} = product} = Client.create_product(@valid_attrs)
    #   assert product.name == "some name"
    # end

    # test "create_product/1 with invalid data returns error changeset" do
    #   assert {:error, %Ecto.Changeset{}} = Client.create_product(@invalid_attrs)
    # end

    # test "update_product/2 with valid data updates the product" do
    #   product = product_fixture()
    #   assert {:ok, %Product{} = product} = Client.update_product(product, @update_attrs)
    #   assert product.name == "some updated name"
    # end

    # test "update_product/2 with invalid data returns error changeset" do
    #   product = product_fixture()
    #   assert {:error, %Ecto.Changeset{}} = Client.update_product(product, @invalid_attrs)
    #   assert product == Client.get_product!(product.id)
    # end

    # test "delete_product/1 deletes the product" do
    #   product = product_fixture()
    #   assert {:ok, %Product{}} = Client.delete_product(product)
    #   assert_raise Ecto.NoResultsError, fn -> Client.get_product!(product.id) end
    # end

    # test "change_product/1 returns a product changeset" do
    #   product = product_fixture()
    #   assert %Ecto.Changeset{} = Client.change_product(product)
    # end
  # end

  # describe "factors" do
  #   alias MvpApi.Client.Factor

  #   @valid_attrs %{name: "Humedad", value: "120.5", weighing: "120.5"}
  #   @update_attrs %{name: "Dureza", value: "456.7", weighing: "456.7"}
  #   @invalid_attrs %{name: nil, value: nil, weighing: nil}

  #   def factor_fixture(attrs \\ %{}) do
  #     {:ok, factor} =
  #       attrs
  #       |> Enum.into(@valid_attrs)
  #       |> Client.create_factor()

  #     factor
  #   end

  # test "list_factors/0 returns all factors" do
  #   factor = factor_fixture()
  #   assert Client.list_factors() == [factor]
  # end

  # test "get_factor!/1 returns the factor with given id" do
  #   factor = factor_fixture()
  #   assert Client.get_factor!(factor.id) == factor
  # end

  # test "create_factor/1 with valid data creates a factor" do
  #   assert {:ok, %Factor{} = factor} = Client.create_factor(@valid_attrs)
  #   assert factor.name == "Humedad"
  #   assert factor.value == Decimal.new("120.5")
  #   assert factor.weighing == Decimal.new("120.5")
  # end

  # test "create_factor/1 with invalid data returns error changeset" do
  #   assert {:error, %Ecto.Changeset{}} = Client.create_factor(@invalid_attrs)
  # end

  # test "update_factor/2 with valid data updates the factor" do
  #   factor = factor_fixture()
  #   assert {:ok, %Factor{} = factor} = Client.update_factor(factor, @update_attrs)
  #   assert factor.name == "Dureza"
  #   assert factor.value == Decimal.new("456.7")
  #   assert factor.weighing == Decimal.new("456.7")
  # end

  # test "update_factor/2 with invalid data returns error changeset" do
  #   factor = factor_fixture()
  #   assert {:error, %Ecto.Changeset{}} = Client.update_factor(factor, @invalid_attrs)
  #   assert factor == Client.get_factor!(factor.id)
  # end

  # test "delete_factor/1 deletes the factor" do
  #   factor = factor_fixture()
  #   assert {:ok, %Factor{}} = Client.delete_factor(factor)
  #   assert_raise Ecto.NoResultsError, fn -> Client.get_factor!(factor.id) end
  # end

  # test "change_factor/1 returns a factor changeset" do
  #   factor = factor_fixture()
  #   assert %Ecto.Changeset{} = Client.change_factor(factor)
  # end
  # end
end
