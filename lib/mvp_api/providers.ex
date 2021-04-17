defmodule MvpApi.Providers do
  @moduledoc """
  The Providers context.
  """

  import Ecto.Query, warn: false
  alias MvpApi.Repo
  alias MvpApi.Providers.ProcessProvider

  alias MvpApi.Providers.Provider

  @doc """
  Returns the list of providers.

  ## Examples

      iex> list_providers()
      [%Provider{}, ...]

  """
  def list_providers do
    Repo.all(Provider)
  end

  @doc """
  Gets a single provider.

  Raises `Ecto.NoResultsError` if the Provider does not exist.

  ## Examples

      iex> get_provider!(123)
      %Provider{}

      iex> get_provider!(456)
      ** (Ecto.NoResultsError)

  """
  def get_provider!(id), do: Repo.get!(Provider, id)

  @doc """
  Creates a provider.

  ## Examples

      iex> create_provider(%{field: value})
      {:ok, %Provider{}}

      iex> create_provider(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_provider(attrs \\ %{}) do
    %Provider{}
    |> Provider.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a provider.

  ## Examples

      iex> update_provider(provider, %{field: new_value})
      {:ok, %Provider{}}

      iex> update_provider(provider, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_provider(%Provider{} = provider, attrs) do
    provider
    |> Provider.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a provider.

  ## Examples

      iex> delete_provider(provider)
      {:ok, %Provider{}}

      iex> delete_provider(provider)
      {:error, %Ecto.Changeset{}}

  """
  def delete_provider(%Provider{} = provider) do
    Repo.delete(provider)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking provider changes.

  ## Examples

      iex> change_provider(provider)
      %Ecto.Changeset{data: %Provider{}}

  """
  def change_provider(%Provider{} = provider, attrs \\ %{}) do
    Provider.changeset(provider, attrs)
  end

  @doc """
  Get all the providers of a process

  returns a %ProcessProvider{}
  """

  def get_providers_of_process(process_id) do
    ProcessProvider
    |> Repo.all(process_id: process_id)
    |> Repo.preload([:provider_evaluation, :process, :provider, :transportation_schemas])
  end

  @doc """
  Adds a provider to a process
  """
  def add_provider_to_process(attrs \\ %{}) do
    %ProcessProvider{}
    |> ProcessProvider.changeset(attrs)
    |> Repo.insert()
    |> case do
      {:ok, %ProcessProvider{} = process_provider} ->
        {:ok,
         Repo.preload(process_provider, [
           :process,
           :provider,
           :provider_evaluation,
           :transportation_schemas
         ])}

      error ->
        error
    end
  end

  alias MvpApi.Providers.ProviderEvaluation

  @doc """
  Returns the list of provider_evaluations.

  ## Examples

      iex> list_provider_evaluations()
      [%ProviderEvaluation{}, ...]

  """
  def list_provider_evaluations do
    Repo.all(ProviderEvaluation)
  end

  @doc """
  Gets a single provider_evaluation.

  Raises `Ecto.NoResultsError` if the Provider evaluation does not exist.

  ## Examples

      iex> get_provider_evaluation!(123)
      %ProviderEvaluation{}

      iex> get_provider_evaluation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_provider_evaluation!(id), do: Repo.get!(ProviderEvaluation, id)

  @doc """
  Gets a provider_evaluation from a provider in a process

  Raises `Ecto.NoResultsError` if the Provider evaluation does not exist.

  ## Examples

      iex> get_provider_evaluation_process_provider!(123)
      %ProviderEvaluation{}

      iex> get_provider_evaluation_process_provider!(456)
      ** (Ecto.NoResultsError)

  """
  def get_provider_evaluation_process_provider!(id),
    do: ProviderEvaluation |> Repo.get_by!(process_provider_id: id)

  @doc """
  Creates a provider_evaluation.

  ## Examples

      iex> create_provider_evaluation(%{field: value})
      {:ok, %ProviderEvaluation{}}

      iex> create_provider_evaluation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_provider_evaluation(attrs \\ %{}) do
    %ProviderEvaluation{}
    |> ProviderEvaluation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a provider_evaluation.

  ## Examples

      iex> update_provider_evaluation(provider_evaluation, %{field: new_value})
      {:ok, %ProviderEvaluation{}}

      iex> update_provider_evaluation(provider_evaluation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_provider_evaluation(%ProviderEvaluation{} = provider_evaluation, attrs) do
    provider_evaluation
    |> ProviderEvaluation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a provider_evaluation.

  ## Examples

      iex> delete_provider_evaluation(provider_evaluation)
      {:ok, %ProviderEvaluation{}}

      iex> delete_provider_evaluation(provider_evaluation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_provider_evaluation(%ProviderEvaluation{} = provider_evaluation) do
    Repo.delete(provider_evaluation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking provider_evaluation changes.

  ## Examples

      iex> change_provider_evaluation(provider_evaluation)
      %Ecto.Changeset{data: %ProviderEvaluation{}}

  """
  def change_provider_evaluation(%ProviderEvaluation{} = provider_evaluation, attrs \\ %{}) do
    ProviderEvaluation.changeset(provider_evaluation, attrs)
  end

  alias MvpApi.Providers.TransportationSchema

  @doc """
  Returns the list of transportation_schemas.

  ## Examples

      iex> list_transportation_schemas()
      [%TransportationSchema{}, ...]

  """
  def list_transportation_schemas do
    Repo.all(TransportationSchema)
  end

  @doc """
  Gets a single transportation_schema.

  Raises `Ecto.NoResultsError` if the Transportation schema does not exist.

  ## Examples

      iex> get_transportation_schema!(123)
      %TransportationSchema{}

      iex> get_transportation_schema!(456)
      ** (Ecto.NoResultsError)

  """
  def get_transportation_schema!(id), do: Repo.get!(TransportationSchema, id)

  @doc """
  Gets a provider_evaluation from a provider in a process

  Raises `Ecto.NoResultsError` if the Provider evaluation does not exist.

  ## Examples

      iex> get_provider_evaluation_process_provider!(123)
      %ProviderEvaluation{}

      iex> get_provider_evaluation_process_provider!(456)
      ** (Ecto.NoResultsError)

  """
  def get_transportation_schema_process_provider!(id),
    do:
      TransportationSchema
      |> Repo.get_by!(process_provider_id: id)
      |> Repo.preload(:process_provider)

  @doc """
  Creates a transportation_schema.

  ## Examples

      iex> create_transportation_schema(%{field: value})
      {:ok, %TransportationSchema{}}

      iex> create_transportation_schema(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_transportation_schema(attrs \\ %{}) do
    %TransportationSchema{}
    |> TransportationSchema.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a transportation_schema.

  ## Examples

      iex> update_transportation_schema(transportation_schema, %{field: new_value})
      {:ok, %TransportationSchema{}}

      iex> update_transportation_schema(transportation_schema, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_transportation_schema(%TransportationSchema{} = transportation_schema, attrs) do
    transportation_schema
    |> TransportationSchema.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a transportation_schema.

  ## Examples

      iex> delete_transportation_schema(transportation_schema)
      {:ok, %TransportationSchema{}}

      iex> delete_transportation_schema(transportation_schema)
      {:error, %Ecto.Changeset{}}

  """
  def delete_transportation_schema(%TransportationSchema{} = transportation_schema) do
    Repo.delete(transportation_schema)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking transportation_schema changes.

  ## Examples

      iex> change_transportation_schema(transportation_schema)
      %Ecto.Changeset{data: %TransportationSchema{}}

  """
  def change_transportation_schema(%TransportationSchema{} = transportation_schema, attrs \\ %{}) do
    TransportationSchema.changeset(transportation_schema, attrs)
  end
end
