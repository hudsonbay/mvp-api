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
end
