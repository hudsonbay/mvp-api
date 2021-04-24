defmodule MvpApi.Knowledge do
  @moduledoc """
  The Knowledge context.
  """

  import Ecto.Query, warn: false
  alias MvpApi.Repo

  alias MvpApi.Knowledge.InnovationProject

  @doc """
  Returns the list of innovation_projects.

  ## Examples

      iex> list_innovation_projects()
      [%InnovationProject{}, ...]

  """
  def list_innovation_projects do
    Repo.all(InnovationProject)
  end

  @doc """
  Gets a single innovation_project.

  Raises `Ecto.NoResultsError` if the Innovation project does not exist.

  ## Examples

      iex> get_innovation_project!(123)
      %InnovationProject{}

      iex> get_innovation_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_innovation_project!(id), do: Repo.get!(InnovationProject, id)

  @doc """
  Creates a innovation_project.

  ## Examples

      iex> create_innovation_project(%{field: value})
      {:ok, %InnovationProject{}}

      iex> create_innovation_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_innovation_project(attrs \\ %{}) do
    %InnovationProject{}
    |> InnovationProject.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a innovation_project.

  ## Examples

      iex> update_innovation_project(innovation_project, %{field: new_value})
      {:ok, %InnovationProject{}}

      iex> update_innovation_project(innovation_project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_innovation_project(%InnovationProject{} = innovation_project, attrs) do
    innovation_project
    |> InnovationProject.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a innovation_project.

  ## Examples

      iex> delete_innovation_project(innovation_project)
      {:ok, %InnovationProject{}}

      iex> delete_innovation_project(innovation_project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_innovation_project(%InnovationProject{} = innovation_project) do
    Repo.delete(innovation_project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking innovation_project changes.

  ## Examples

      iex> change_innovation_project(innovation_project)
      %Ecto.Changeset{data: %InnovationProject{}}

  """
  def change_innovation_project(%InnovationProject{} = innovation_project, attrs \\ %{}) do
    InnovationProject.changeset(innovation_project, attrs)
  end

  alias MvpApi.Knowledge.IntangibleFixedAsset

  @doc """
  Returns the list of intangible_fixed_assets.

  ## Examples

      iex> list_intangible_fixed_assets()
      [%IntangibleFixedAsset{}, ...]

  """
  def list_intangible_fixed_assets do
    Repo.all(IntangibleFixedAsset)
  end

  @doc """
  Gets a single intangible_fixed_asset.

  Raises `Ecto.NoResultsError` if the Intangible fixed asset does not exist.

  ## Examples

      iex> get_intangible_fixed_asset!(123)
      %IntangibleFixedAsset{}

      iex> get_intangible_fixed_asset!(456)
      ** (Ecto.NoResultsError)

  """
  def get_intangible_fixed_asset!(id), do: Repo.get!(IntangibleFixedAsset, id)

  @doc """
  Creates a intangible_fixed_asset.

  ## Examples

      iex> create_intangible_fixed_asset(%{field: value})
      {:ok, %IntangibleFixedAsset{}}

      iex> create_intangible_fixed_asset(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_intangible_fixed_asset(attrs \\ %{}) do
    %IntangibleFixedAsset{}
    |> IntangibleFixedAsset.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a intangible_fixed_asset.

  ## Examples

      iex> update_intangible_fixed_asset(intangible_fixed_asset, %{field: new_value})
      {:ok, %IntangibleFixedAsset{}}

      iex> update_intangible_fixed_asset(intangible_fixed_asset, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_intangible_fixed_asset(%IntangibleFixedAsset{} = intangible_fixed_asset, attrs) do
    intangible_fixed_asset
    |> IntangibleFixedAsset.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a intangible_fixed_asset.

  ## Examples

      iex> delete_intangible_fixed_asset(intangible_fixed_asset)
      {:ok, %IntangibleFixedAsset{}}

      iex> delete_intangible_fixed_asset(intangible_fixed_asset)
      {:error, %Ecto.Changeset{}}

  """
  def delete_intangible_fixed_asset(%IntangibleFixedAsset{} = intangible_fixed_asset) do
    Repo.delete(intangible_fixed_asset)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking intangible_fixed_asset changes.

  ## Examples

      iex> change_intangible_fixed_asset(intangible_fixed_asset)
      %Ecto.Changeset{data: %IntangibleFixedAsset{}}

  """
  def change_intangible_fixed_asset(%IntangibleFixedAsset{} = intangible_fixed_asset, attrs \\ %{}) do
    IntangibleFixedAsset.changeset(intangible_fixed_asset, attrs)
  end
end
