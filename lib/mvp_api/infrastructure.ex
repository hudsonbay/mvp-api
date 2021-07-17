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

  alias MvpApi.Infrastructure.UtilTool

  @doc """
  Returns the list of utils_tools.

  ## Examples

      iex> list_utils_tools()
      [%UtilTool{}, ...]

  """
  def list_utils_tools do
    Repo.all(UtilTool)
  end

  @doc """
  Gets a single util_tool.

  Raises `Ecto.NoResultsError` if the Util tool does not exist.

  ## Examples

      iex> get_util_tool!(123)
      %UtilTool{}

      iex> get_util_tool!(456)
      ** (Ecto.NoResultsError)

  """
  def get_util_tool!(id), do: Repo.get!(UtilTool, id)

  @doc """
  Creates a util_tool.

  ## Examples

      iex> create_util_tool(%{field: value})
      {:ok, %UtilTool{}}

      iex> create_util_tool(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_util_tool(attrs \\ %{}) do
    %UtilTool{}
    |> UtilTool.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a util_tool.

  ## Examples

      iex> update_util_tool(util_tool, %{field: new_value})
      {:ok, %UtilTool{}}

      iex> update_util_tool(util_tool, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_util_tool(%UtilTool{} = util_tool, attrs) do
    util_tool
    |> UtilTool.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a util_tool.

  ## Examples

      iex> delete_util_tool(util_tool)
      {:ok, %UtilTool{}}

      iex> delete_util_tool(util_tool)
      {:error, %Ecto.Changeset{}}

  """
  def delete_util_tool(%UtilTool{} = util_tool) do
    Repo.delete(util_tool)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking util_tool changes.

  ## Examples

      iex> change_util_tool(util_tool)
      %Ecto.Changeset{data: %UtilTool{}}

  """
  def change_util_tool(%UtilTool{} = util_tool, attrs \\ %{}) do
    UtilTool.changeset(util_tool, attrs)
  end

  alias MvpApi.Infrastructure.Metrology.ControlPoint

  @doc """
  Returns the list of control_points.

  ## Examples

      iex> list_control_points()
      [%ControlPoint{}, ...]

  """
  def list_control_points do
    Repo.all(ControlPoint)
  end

  @doc """
  Gets a single control_point.

  Raises `Ecto.NoResultsError` if the Control point does not exist.

  ## Examples

      iex> get_control_point!(123)
      %ControlPoint{}

      iex> get_control_point!(456)
      ** (Ecto.NoResultsError)

  """
  def get_control_point!(id), do: Repo.get!(ControlPoint, id)

  @doc """
  Creates a control_point.

  ## Examples

      iex> create_control_point(%{field: value})
      {:ok, %ControlPoint{}}

      iex> create_control_point(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_control_point(attrs \\ %{}) do
    %ControlPoint{}
    |> ControlPoint.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a control_point.

  ## Examples

      iex> update_control_point(control_point, %{field: new_value})
      {:ok, %ControlPoint{}}

      iex> update_control_point(control_point, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_control_point(%ControlPoint{} = control_point, attrs) do
    control_point
    |> ControlPoint.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a control_point.

  ## Examples

      iex> delete_control_point(control_point)
      {:ok, %ControlPoint{}}

      iex> delete_control_point(control_point)
      {:error, %Ecto.Changeset{}}

  """
  def delete_control_point(%ControlPoint{} = control_point) do
    Repo.delete(control_point)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking control_point changes.

  ## Examples

      iex> change_control_point(control_point)
      %Ecto.Changeset{data: %ControlPoint{}}

  """
  def change_control_point(%ControlPoint{} = control_point, attrs \\ %{}) do
    ControlPoint.changeset(control_point, attrs)
  end

  alias MvpApi.Infrastructure.Protection.Action

  @doc """
  Returns the list of protection_actions.

  ## Examples

      iex> list_protection_actions()
      [%Action{}, ...]

  """
  def list_protection_actions do
    Repo.all(Action)
  end

  @doc """
  Gets a single action.

  Raises `Ecto.NoResultsError` if the Action does not exist.

  ## Examples

      iex> get_action!(123)
      %Action{}

      iex> get_action!(456)
      ** (Ecto.NoResultsError)

  """
  def get_action!(id), do: Repo.get!(Action, id)

  @doc """
  Creates a action.

  ## Examples

      iex> create_action(%{field: value})
      {:ok, %Action{}}

      iex> create_action(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_action(attrs \\ %{}) do
    %Action{}
    |> Action.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a action.

  ## Examples

      iex> update_action(action, %{field: new_value})
      {:ok, %Action{}}

      iex> update_action(action, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_action(%Action{} = action, attrs) do
    action
    |> Action.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a action.

  ## Examples

      iex> delete_action(action)
      {:ok, %Action{}}

      iex> delete_action(action)
      {:error, %Ecto.Changeset{}}

  """
  def delete_action(%Action{} = action) do
    Repo.delete(action)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking action changes.

  ## Examples

      iex> change_action(action)
      %Ecto.Changeset{data: %Action{}}

  """
  def change_action(%Action{} = action, attrs \\ %{}) do
    Action.changeset(action, attrs)
  end
end
