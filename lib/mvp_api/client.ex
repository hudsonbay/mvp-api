defmodule MvpApi.Client do
  @moduledoc """
  The Client context.
  """

  import Ecto.Query, warn: false
  alias MvpApi.Repo

  alias MvpApi.Client.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
    |> Repo.preload(:factors)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  # def get_product!(id), do: Repo.get!(Product, id)
  def get_product!(id) do
    Product
    |> Repo.get!(id)
    |> Repo.preload(:factors)
  end

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
    |> case do
      {:ok, %Product{} = product} -> {:ok, Repo.preload(product, :factors)}
      error -> error
    end
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{data: %Product{}}

  """
  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end

  alias MvpApi.Client.Factor

  @doc """
  Returns the list of factors.

  ## Examples

      iex> list_factors()
      [%Factor{}, ...]

  """
  def list_factors do
    Repo.all(Factor)
  end

  @doc """
  Gets a single factor.

  Raises `Ecto.NoResultsError` if the Factor does not exist.

  ## Examples

      iex> get_factor!(123)
      %Factor{}

      iex> get_factor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_factor!(id), do: Repo.get!(Factor, id)

  @doc """
  Creates a factor.

  ## Examples

      iex> create_factor(%{field: value})
      {:ok, %Factor{}}

      iex> create_factor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_factor(%Product{} = product, attrs \\ %{}) do
    product
    |> Ecto.build_assoc(:factors)
    |> Factor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a factor.

  ## Examples

      iex> update_factor(factor, %{field: new_value})
      {:ok, %Factor{}}

      iex> update_factor(factor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_factor(%Factor{} = factor, attrs) do
    factor
    |> Factor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a factor.

  ## Examples

      iex> delete_factor(factor)
      {:ok, %Factor{}}

      iex> delete_factor(factor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_factor(%Factor{} = factor) do
    Repo.delete(factor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking factor changes.

  ## Examples

      iex> change_factor(factor)
      %Ecto.Changeset{data: %Factor{}}

  """
  def change_factor(%Factor{} = factor, attrs \\ %{}) do
    Factor.changeset(factor, attrs)
  end

  def get_factors(product_id) do
    Ecto.Adapters.SQL.query(
      Repo,
      "SELECT value , weighing  FROM factors WHERE factors.product_id = ^product_id"
    )
  end
end
