defmodule MvpApi.Infrastructure.Protection.Action do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [
    :name,
    :resource,
    :quantity,
    :price_per_unit,
    :useful_life_months,
    :monthly_payment,
    :observations
  ]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "protection_actions" do
    field :annual_cost, Money.Ecto.Composite.Type, null: false
    field :monthly_payment, Money.Ecto.Composite.Type, null: false
    field :name, :string, null: false
    field :observations, :string, null: false
    field :price_per_unit, Money.Ecto.Composite.Type, null: false
    field :quantity, :integer, null: false
    field :resource, :string, null: false
    field :useful_life_months, :integer, null: false

    timestamps()
  end

  @doc false
  def changeset(action, attrs) do
    action
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields |> List.pop_at(-1) |> elem(1))
    |> calculate_annual_cost()
  end

  defp calculate_annual_cost(changeset) do
    monthly_payment = get_field(changeset, :monthly_payment)
    price_per_unit = get_field(changeset, :price_per_unit)
    quantity = get_field(changeset, :quantity)
    useful_life_months = get_field(changeset, :useful_life_months)

    sum_1 =
      monthly_payment
      |> Money.mult!(quantity)
      |> Money.mult!(12)

    sum_2 =
      price_per_unit
      |> Money.mult!(quantity)
      |> Money.mult!(12)
      |> Money.div!(useful_life_months)

    with {:ok, sum} <- Money.sum([sum_1, sum_2]) do
      put_change(changeset, :annual_cost, sum)
    end
  end
end
