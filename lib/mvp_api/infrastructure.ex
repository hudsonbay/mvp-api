defmodule MvpApi.Infrastructure do
  @moduledoc """
  The Infrastructure context.
  """

  import Ecto.Query, warn: false
  alias MvpApi.Repo

  alias MvpApi.Infrastructure.TangibleFixedAsset

  @doc """
  Returns the list of tangible_fixed_assets.

  ## Examples

      iex> list_tangible_fixed_assets()
      [%TangibleFixedAsset{}, ...]

  """
  def list_tangible_fixed_assets do
    Repo.all(TangibleFixedAsset)
  end

  @doc """
  Gets a single tangible_fixed_asset.

  Raises `Ecto.NoResultsError` if the Tangible fixed asset does not exist.

  ## Examples

      iex> get_tangible_fixed_asset!(123)
      %TangibleFixedAsset{}

      iex> get_tangible_fixed_asset!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tangible_fixed_asset!(id), do: Repo.get!(TangibleFixedAsset, id)

  @doc """
  Creates a tangible_fixed_asset.

  ## Examples

      iex> create_tangible_fixed_asset(%{field: value})
      {:ok, %TangibleFixedAsset{}}

      iex> create_tangible_fixed_asset(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tangible_fixed_asset(attrs \\ %{}) do
    %TangibleFixedAsset{}
    |> TangibleFixedAsset.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tangible_fixed_asset.

  ## Examples

      iex> update_tangible_fixed_asset(tangible_fixed_asset, %{field: new_value})
      {:ok, %TangibleFixedAsset{}}

      iex> update_tangible_fixed_asset(tangible_fixed_asset, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tangible_fixed_asset(%TangibleFixedAsset{} = tangible_fixed_asset, attrs) do
    tangible_fixed_asset
    |> TangibleFixedAsset.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tangible_fixed_asset.

  ## Examples

      iex> delete_tangible_fixed_asset(tangible_fixed_asset)
      {:ok, %TangibleFixedAsset{}}

      iex> delete_tangible_fixed_asset(tangible_fixed_asset)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tangible_fixed_asset(%TangibleFixedAsset{} = tangible_fixed_asset) do
    Repo.delete(tangible_fixed_asset)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tangible_fixed_asset changes.

  ## Examples

      iex> change_tangible_fixed_asset(tangible_fixed_asset)
      %Ecto.Changeset{data: %TangibleFixedAsset{}}

  """
  def change_tangible_fixed_asset(%TangibleFixedAsset{} = tangible_fixed_asset, attrs \\ %{}) do
    TangibleFixedAsset.changeset(tangible_fixed_asset, attrs)
  end
end
