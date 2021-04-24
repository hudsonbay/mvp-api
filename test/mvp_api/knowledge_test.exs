defmodule MvpApi.KnowledgeTest do
  use MvpApi.DataCase

  alias MvpApi.Knowledge

  describe "innovation_projects" do
    alias MvpApi.Knowledge.InnovationProject

    @valid_attrs %{
      budget: Money.new!(:CUP, "120.5"),
      expected_annual_effect: "120.5",
      expected_result: "some expected_result",
      name: "some name",
      objective: "some objective",
      observation: "some observation",
      term: "120.5"
    }
    @update_attrs %{
      budget: Money.new!(:CUP, "456.7"),
      expected_annual_effect: "456.7",
      expected_result: "some updated expected_result",
      name: "some updated name",
      objective: "some updated objective",
      observation: "some updated observation",
      term: "456.7"
    }
    @invalid_attrs %{
      budget: nil,
      expected_annual_effect: nil,
      expected_result: nil,
      name: nil,
      objective: nil,
      observation: nil,
      term: nil
    }

    def innovation_project_fixture(attrs \\ %{}) do
      {:ok, innovation_project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Knowledge.create_innovation_project()

      innovation_project
    end

    test "list_innovation_projects/0 returns all innovation_projects" do
      innovation_project = innovation_project_fixture()
      assert Knowledge.list_innovation_projects() == [innovation_project]
    end

    test "get_innovation_project!/1 returns the innovation_project with given id" do
      innovation_project = innovation_project_fixture()
      assert Knowledge.get_innovation_project!(innovation_project.id) == innovation_project
    end

    test "create_innovation_project/1 with valid data creates a innovation_project" do
      assert {:ok, %InnovationProject{} = innovation_project} =
               Knowledge.create_innovation_project(@valid_attrs)

      assert innovation_project.budget == Money.new!(:CUP, "120.5")
      assert innovation_project.expected_annual_effect == Decimal.new("120.5")
      assert innovation_project.expected_result == "some expected_result"
      assert innovation_project.name == "some name"
      assert innovation_project.objective == "some objective"
      assert innovation_project.observation == "some observation"
      assert innovation_project.term == Decimal.new("120.5")
    end

    test "create_innovation_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Knowledge.create_innovation_project(@invalid_attrs)
    end

    test "update_innovation_project/2 with valid data updates the innovation_project" do
      innovation_project = innovation_project_fixture()

      assert {:ok, %InnovationProject{} = innovation_project} =
               Knowledge.update_innovation_project(innovation_project, @update_attrs)

      assert innovation_project.budget == Money.new!(:CUP, "456.7")
      assert innovation_project.expected_annual_effect == Decimal.new("456.7")
      assert innovation_project.expected_result == "some updated expected_result"
      assert innovation_project.name == "some updated name"
      assert innovation_project.objective == "some updated objective"
      assert innovation_project.observation == "some updated observation"
      assert innovation_project.term == Decimal.new("456.7")
    end

    test "update_innovation_project/2 with invalid data returns error changeset" do
      innovation_project = innovation_project_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Knowledge.update_innovation_project(innovation_project, @invalid_attrs)

      assert innovation_project == Knowledge.get_innovation_project!(innovation_project.id)
    end

    test "delete_innovation_project/1 deletes the innovation_project" do
      innovation_project = innovation_project_fixture()
      assert {:ok, %InnovationProject{}} = Knowledge.delete_innovation_project(innovation_project)

      assert_raise Ecto.NoResultsError, fn ->
        Knowledge.get_innovation_project!(innovation_project.id)
      end
    end

    test "change_innovation_project/1 returns a innovation_project changeset" do
      innovation_project = innovation_project_fixture()
      assert %Ecto.Changeset{} = Knowledge.change_innovation_project(innovation_project)
    end
  end

  describe "intangible_fixed_assets" do
    alias MvpApi.Knowledge.IntangibleFixedAsset

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def intangible_fixed_asset_fixture(attrs \\ %{}) do
      {:ok, intangible_fixed_asset} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Knowledge.create_intangible_fixed_asset()

      intangible_fixed_asset
    end

    test "list_intangible_fixed_assets/0 returns all intangible_fixed_assets" do
      intangible_fixed_asset = intangible_fixed_asset_fixture()
      assert Knowledge.list_intangible_fixed_assets() == [intangible_fixed_asset]
    end

    test "get_intangible_fixed_asset!/1 returns the intangible_fixed_asset with given id" do
      intangible_fixed_asset = intangible_fixed_asset_fixture()
      assert Knowledge.get_intangible_fixed_asset!(intangible_fixed_asset.id) == intangible_fixed_asset
    end

    test "create_intangible_fixed_asset/1 with valid data creates a intangible_fixed_asset" do
      assert {:ok, %IntangibleFixedAsset{} = intangible_fixed_asset} = Knowledge.create_intangible_fixed_asset(@valid_attrs)
      assert intangible_fixed_asset.description == "some description"
      assert intangible_fixed_asset.name == "some name"
    end

    test "create_intangible_fixed_asset/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Knowledge.create_intangible_fixed_asset(@invalid_attrs)
    end

    test "update_intangible_fixed_asset/2 with valid data updates the intangible_fixed_asset" do
      intangible_fixed_asset = intangible_fixed_asset_fixture()
      assert {:ok, %IntangibleFixedAsset{} = intangible_fixed_asset} = Knowledge.update_intangible_fixed_asset(intangible_fixed_asset, @update_attrs)
      assert intangible_fixed_asset.description == "some updated description"
      assert intangible_fixed_asset.name == "some updated name"
    end

    test "update_intangible_fixed_asset/2 with invalid data returns error changeset" do
      intangible_fixed_asset = intangible_fixed_asset_fixture()
      assert {:error, %Ecto.Changeset{}} = Knowledge.update_intangible_fixed_asset(intangible_fixed_asset, @invalid_attrs)
      assert intangible_fixed_asset == Knowledge.get_intangible_fixed_asset!(intangible_fixed_asset.id)
    end

    test "delete_intangible_fixed_asset/1 deletes the intangible_fixed_asset" do
      intangible_fixed_asset = intangible_fixed_asset_fixture()
      assert {:ok, %IntangibleFixedAsset{}} = Knowledge.delete_intangible_fixed_asset(intangible_fixed_asset)
      assert_raise Ecto.NoResultsError, fn -> Knowledge.get_intangible_fixed_asset!(intangible_fixed_asset.id) end
    end

    test "change_intangible_fixed_asset/1 returns a intangible_fixed_asset changeset" do
      intangible_fixed_asset = intangible_fixed_asset_fixture()
      assert %Ecto.Changeset{} = Knowledge.change_intangible_fixed_asset(intangible_fixed_asset)
    end
  end
end
