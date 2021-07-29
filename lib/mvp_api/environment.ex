defmodule MvpApi.Environment do
  @moduledoc """
  The Environment context.
  """

  import Ecto.Query, warn: false
  alias MvpApi.Repo

  alias MvpApi.Environment.WasteMaterials

  @doc """
  Returns the list of waste_materials.

  ## Examples

      iex> list_waste_materials()
      [%WasteMaterials{}, ...]

  """
  def list_waste_materials do
    Repo.all(WasteMaterials)
  end

  @doc """
  Gets a single waste_materials.

  Raises `Ecto.NoResultsError` if the Waste materials does not exist.

  ## Examples

      iex> get_waste_materials!(123)
      %WasteMaterials{}

      iex> get_waste_materials!(456)
      ** (Ecto.NoResultsError)

  """
  def get_waste_materials!(id), do: Repo.get!(WasteMaterials, id)

  @doc """
  Creates a waste_materials.

  ## Examples

      iex> create_waste_materials(%{field: value})
      {:ok, %WasteMaterials{}}

      iex> create_waste_materials(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_waste_materials(attrs \\ %{}) do
    %WasteMaterials{}
    |> WasteMaterials.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a waste_materials.

  ## Examples

      iex> update_waste_materials(waste_materials, %{field: new_value})
      {:ok, %WasteMaterials{}}

      iex> update_waste_materials(waste_materials, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_waste_materials(%WasteMaterials{} = waste_materials, attrs) do
    waste_materials
    |> WasteMaterials.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a waste_materials.

  ## Examples

      iex> delete_waste_materials(waste_materials)
      {:ok, %WasteMaterials{}}

      iex> delete_waste_materials(waste_materials)
      {:error, %Ecto.Changeset{}}

  """
  def delete_waste_materials(%WasteMaterials{} = waste_materials) do
    Repo.delete(waste_materials)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking waste_materials changes.

  ## Examples

      iex> change_waste_materials(waste_materials)
      %Ecto.Changeset{data: %WasteMaterials{}}

  """
  def change_waste_materials(%WasteMaterials{} = waste_materials, attrs \\ %{}) do
    WasteMaterials.changeset(waste_materials, attrs)
  end
end
