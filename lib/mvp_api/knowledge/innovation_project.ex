defmodule MvpApi.Knowledge.InnovationProject do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "innovation_projects" do
    field :budget, Money.Ecto.Composite.Type
    field :expected_annual_effect, :decimal
    field :expected_result, :string
    field :name, :string
    field :objective, :string
    field :observation, :string
    field :term, :decimal
    field :annual_cost, Money.Ecto.Composite.Type, virtual: true

    timestamps()
  end

  @doc false
  def changeset(innovation_project, attrs) do
    innovation_project
    |> cast(attrs, [
      :name,
      :objective,
      :expected_result,
      :budget,
      :term,
      :expected_annual_effect,
      :observation
    ])
    |> validate_required([
      :name,
      :objective,
      :expected_result,
      :budget,
      :term,
      :expected_annual_effect
    ])
    |> calculate_annual_cost()
  end

  defp calculate_annual_cost(changeset) do
    budget = get_change(changeset, :budget)
    term = get_change(changeset, :term)

    with {:ok, cost} <- Money.div(budget, term) do
      put_change(changeset, :annual_cost, cost)
    else
      {:error,  reason} ->
      add_error(changeset, :annual_cost, reason)
    end
  end
end
