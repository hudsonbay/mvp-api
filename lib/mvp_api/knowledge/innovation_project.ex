defmodule MvpApi.Knowledge.InnovationProject do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "innovation_projects" do
    field :budget, Money.Ecto.Composite.Type
    field :expected_annual_effect, Money.Ecto.Composite.Type
    field :expected_result, :string
    field :name, :string
    field :objective, :string
    field :observation, :string
    field :term, :decimal
    field :annual_cost, Money.Ecto.Composite.Type
    field :payback_time, :decimal

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
    |> calculate_payback_time()
  end

  defp calculate_annual_cost(changeset) do
    {_, budget} = fetch_field(changeset, :budget)
    {_, term} = fetch_field(changeset, :term)

    with {:ok, cost} <- Money.div(budget, term) do
      put_change(changeset, :annual_cost, cost)
    end
  end

  defp calculate_payback_time(changeset) do
    expected_annual_effect =
      fetch_field!(changeset, :expected_annual_effect) |> Money.to_decimal()

    budget = fetch_field!(changeset, :budget) |> Money.to_decimal()

    put_change(changeset, :payback_time, Decimal.div(budget, expected_annual_effect))
  end
end
