defmodule MvpApi.ProvidersTest do
  use MvpApi.DataCase

  alias MvpApi.Providers

  describe "providers" do
    alias MvpApi.Providers.Provider

    @valid_attrs %{distance_km: "some distance", location: "some location", name: "some name"}
    @update_attrs %{
      distance_km: "some updated distance",
      location: "some updated location",
      name: "some updated name"
    }
    @invalid_attrs %{distance_km: nil, location: nil, name: nil}

    def provider_fixture(attrs \\ %{}) do
      {:ok, provider} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Providers.create_provider()

      provider
    end

    test "list_providers/0 returns all providers" do
      provider = provider_fixture()
      assert Providers.list_providers() == [provider]
    end

    test "get_provider!/1 returns the provider with given id" do
      provider = provider_fixture()
      assert Providers.get_provider!(provider.id) == provider
    end

    test "create_provider/1 with valid data creates a provider" do
      assert {:ok, %Provider{} = provider} = Providers.create_provider(@valid_attrs)
      assert provider.distance_km == "some distance"
      assert provider.location == "some location"
      assert provider.name == "some name"
    end

    test "create_provider/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Providers.create_provider(@invalid_attrs)
    end

    test "update_provider/2 with valid data updates the provider" do
      provider = provider_fixture()
      assert {:ok, %Provider{} = provider} = Providers.update_provider(provider, @update_attrs)
      assert provider.distance_km == "some updated distance"
      assert provider.location == "some updated location"
      assert provider.name == "some updated name"
    end

    test "update_provider/2 with invalid data returns error changeset" do
      provider = provider_fixture()
      assert {:error, %Ecto.Changeset{}} = Providers.update_provider(provider, @invalid_attrs)
      assert provider == Providers.get_provider!(provider.id)
    end

    test "delete_provider/1 deletes the provider" do
      provider = provider_fixture()
      assert {:ok, %Provider{}} = Providers.delete_provider(provider)
      assert_raise Ecto.NoResultsError, fn -> Providers.get_provider!(provider.id) end
    end

    test "change_provider/1 returns a provider changeset" do
      provider = provider_fixture()
      assert %Ecto.Changeset{} = Providers.change_provider(provider)
    end
  end

  describe "provider_evaluations" do
    alias MvpApi.Providers.ProviderEvaluation

    @valid_attrs %{
      credit: 42,
      credit_weighing: 42,
      punctuality: 42,
      punctuality_weighing: 42,
      quality: 42,
      quality_weighing: 42,
      quantity: 42,
      quantity_weighing: 42,
      relations: 42,
      relations_weighing: 42
    }
    @update_attrs %{
      credit: 43,
      credit_weighing: 43,
      punctuality: 43,
      punctuality_weighing: 43,
      quality: 43,
      quality_weighing: 43,
      quantity: 43,
      quantity_weighing: 43,
      relations: 43,
      relations_weighing: 43
    }
    @invalid_attrs %{
      credit: nil,
      credit_weighing: nil,
      punctuality: nil,
      punctuality_weighing: nil,
      quality: nil,
      quality_weighing: nil,
      quantity: nil,
      quantity_weighing: nil,
      relations: nil,
      relations_weighing: nil
    }

    def provider_evaluation_fixture(attrs \\ %{}) do
      {:ok, provider_evaluation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Providers.create_provider_evaluation()

      provider_evaluation
    end

    test "list_provider_evaluations/0 returns all provider_evaluations" do
      provider_evaluation = provider_evaluation_fixture()
      assert Providers.list_provider_evaluations() == [provider_evaluation]
    end

    test "get_provider_evaluation!/1 returns the provider_evaluation with given id" do
      provider_evaluation = provider_evaluation_fixture()
      assert Providers.get_provider_evaluation!(provider_evaluation.id) == provider_evaluation
    end

    test "create_provider_evaluation/1 with valid data creates a provider_evaluation" do
      assert {:ok, %ProviderEvaluation{} = provider_evaluation} =
               Providers.create_provider_evaluation(@valid_attrs)

      assert provider_evaluation.credit == 42
      assert provider_evaluation.credit_weighing == 42
      assert provider_evaluation.punctuality == 42
      assert provider_evaluation.punctuality_weighing == 42
      assert provider_evaluation.quality == 42
      assert provider_evaluation.quality_weighing == 42
      assert provider_evaluation.quantity == 42
      assert provider_evaluation.quantity_weighing == 42
      assert provider_evaluation.relations == 42
      assert provider_evaluation.relations_weighing == 42
    end

    test "create_provider_evaluation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Providers.create_provider_evaluation(@invalid_attrs)
    end

    test "update_provider_evaluation/2 with valid data updates the provider_evaluation" do
      provider_evaluation = provider_evaluation_fixture()

      assert {:ok, %ProviderEvaluation{} = provider_evaluation} =
               Providers.update_provider_evaluation(provider_evaluation, @update_attrs)

      assert provider_evaluation.credit == 43
      assert provider_evaluation.credit_weighing == 43
      assert provider_evaluation.punctuality == 43
      assert provider_evaluation.punctuality_weighing == 43
      assert provider_evaluation.quality == 43
      assert provider_evaluation.quality_weighing == 43
      assert provider_evaluation.quantity == 43
      assert provider_evaluation.quantity_weighing == 43
      assert provider_evaluation.relations == 43
      assert provider_evaluation.relations_weighing == 43
    end

    test "update_provider_evaluation/2 with invalid data returns error changeset" do
      provider_evaluation = provider_evaluation_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Providers.update_provider_evaluation(provider_evaluation, @invalid_attrs)

      assert provider_evaluation == Providers.get_provider_evaluation!(provider_evaluation.id)
    end

    test "delete_provider_evaluation/1 deletes the provider_evaluation" do
      provider_evaluation = provider_evaluation_fixture()

      assert {:ok, %ProviderEvaluation{}} =
               Providers.delete_provider_evaluation(provider_evaluation)

      assert_raise Ecto.NoResultsError, fn ->
        Providers.get_provider_evaluation!(provider_evaluation.id)
      end
    end

    test "change_provider_evaluation/1 returns a provider_evaluation changeset" do
      provider_evaluation = provider_evaluation_fixture()
      assert %Ecto.Changeset{} = Providers.change_provider_evaluation(provider_evaluation)
    end
  end
end
