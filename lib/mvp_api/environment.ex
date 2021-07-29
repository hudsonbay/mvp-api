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

  alias MvpApi.Environment.WasteProcessProduct

  @doc """
  Returns the list of waste_process_products.

  ## Examples

      iex> list_waste_process_products()
      [%WasteProcessProduct{}, ...]

  """
  def list_waste_process_products do
    Repo.all(WasteProcessProduct)
  end

  @doc """
  Gets a single waste_process_product.

  Raises `Ecto.NoResultsError` if the Waste process product does not exist.

  ## Examples

      iex> get_waste_process_product!(123)
      %WasteProcessProduct{}

      iex> get_waste_process_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_waste_process_product!(id), do: Repo.get!(WasteProcessProduct, id)

  @doc """
  Creates a waste_process_product.

  ## Examples

      iex> create_waste_process_product(%{field: value})
      {:ok, %WasteProcessProduct{}}

      iex> create_waste_process_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_waste_process_product(attrs \\ %{}) do
    %WasteProcessProduct{}
    |> WasteProcessProduct.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a waste_process_product.

  ## Examples

      iex> update_waste_process_product(waste_process_product, %{field: new_value})
      {:ok, %WasteProcessProduct{}}

      iex> update_waste_process_product(waste_process_product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_waste_process_product(%WasteProcessProduct{} = waste_process_product, attrs) do
    waste_process_product
    |> WasteProcessProduct.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a waste_process_product.

  ## Examples

      iex> delete_waste_process_product(waste_process_product)
      {:ok, %WasteProcessProduct{}}

      iex> delete_waste_process_product(waste_process_product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_waste_process_product(%WasteProcessProduct{} = waste_process_product) do
    Repo.delete(waste_process_product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking waste_process_product changes.

  ## Examples

      iex> change_waste_process_product(waste_process_product)
      %Ecto.Changeset{data: %WasteProcessProduct{}}

  """
  def change_waste_process_product(%WasteProcessProduct{} = waste_process_product, attrs \\ %{}) do
    WasteProcessProduct.changeset(waste_process_product, attrs)
  end

  alias MvpApi.Environment.EmanationResidual

  @doc """
  Returns the list of emanation_residuals.

  ## Examples

      iex> list_emanation_residuals()
      [%EmanationResidual{}, ...]

  """
  def list_emanation_residuals do
    Repo.all(EmanationResidual)
  end

  @doc """
  Gets a single emanation_residual.

  Raises `Ecto.NoResultsError` if the Emanation residual does not exist.

  ## Examples

      iex> get_emanation_residual!(123)
      %EmanationResidual{}

      iex> get_emanation_residual!(456)
      ** (Ecto.NoResultsError)

  """
  def get_emanation_residual!(id), do: Repo.get!(EmanationResidual, id)

  @doc """
  Creates a emanation_residual.

  ## Examples

      iex> create_emanation_residual(%{field: value})
      {:ok, %EmanationResidual{}}

      iex> create_emanation_residual(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_emanation_residual(attrs \\ %{}) do
    %EmanationResidual{}
    |> EmanationResidual.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a emanation_residual.

  ## Examples

      iex> update_emanation_residual(emanation_residual, %{field: new_value})
      {:ok, %EmanationResidual{}}

      iex> update_emanation_residual(emanation_residual, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_emanation_residual(%EmanationResidual{} = emanation_residual, attrs) do
    emanation_residual
    |> EmanationResidual.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a emanation_residual.

  ## Examples

      iex> delete_emanation_residual(emanation_residual)
      {:ok, %EmanationResidual{}}

      iex> delete_emanation_residual(emanation_residual)
      {:error, %Ecto.Changeset{}}

  """
  def delete_emanation_residual(%EmanationResidual{} = emanation_residual) do
    Repo.delete(emanation_residual)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking emanation_residual changes.

  ## Examples

      iex> change_emanation_residual(emanation_residual)
      %Ecto.Changeset{data: %EmanationResidual{}}

  """
  def change_emanation_residual(%EmanationResidual{} = emanation_residual, attrs \\ %{}) do
    EmanationResidual.changeset(emanation_residual, attrs)
  end
end
