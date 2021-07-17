defmodule MvpApi.Infrastructure.Metrology.ControlPoint do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [
    :name,
    :variable_to_control,
    :instrument,
    :precision,
    :quantity,
    :dedicated_percentage,
    :price_per_unit,
    :useful_life_years,
    :verification_frequency_months,
    :price_per_verification,
    :executor
  ]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "control_points" do
    field :annual_cost_verification, Money.Ecto.Composite.Type, null: false
    field :annual_total_expense, Money.Ecto.Composite.Type, null: false
    field :dedicated_percentage, :decimal, null: false
    field :executor, :string, null: false
    field :instrument, :string, null: false
    field :name, :string, null: false
    field :precision, :string, null: false
    field :price_per_unit, Money.Ecto.Composite.Type, null: false
    field :price_per_verification, Money.Ecto.Composite.Type, null: false
    field :quantity, :integer, null: false
    field :total_amount, Money.Ecto.Composite.Type, null: false
    field :useful_life_years, :integer, null: false
    field :variable_to_control, :string, null: false
    field :verification_frequency_months, :integer, null: false

    timestamps()
  end

  @doc false
  def changeset(control_point, attrs) do
    control_point
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_number(:dedicated_percentage,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100
    )
    |> calculate_total_amount()
    |> calculate_annual_cost_verification()
    |> calcuate_annual_total_expense()
  end

  defp calculate_total_amount(changeset) do
    price_per_unit = get_field(changeset, :price_per_unit)
    quantity = get_field(changeset, :quantity)
    dedicated_percentage = get_field(changeset, :dedicated_percentage)

    result =
      price_per_unit
      |> Money.mult!(quantity)
      |> Money.mult!(dedicated_percentage)
      |> Money.div!(100)

    put_change(changeset, :total_amount, result)
  end

  defp calculate_annual_cost_verification(changeset) do
    price_per_verification = get_field(changeset, :price_per_verification)
    verification_frequency_months = get_field(changeset, :verification_frequency_months)
    dedicated_percentage = get_field(changeset, :dedicated_percentage)

    result =
      price_per_verification
      |> Money.mult!(Decimal.div(12, verification_frequency_months))
      |> Money.mult!(dedicated_percentage)
      |> Money.div!(100)

    put_change(changeset, :annual_cost_verification, result)
  end

  defp calcuate_annual_total_expense(changeset) do
    useful_life_years = get_field(changeset, :useful_life_years)
    total_amount = get_field(changeset, :total_amount)

    put_change(changeset, :annual_total_expense, Money.div!(total_amount, useful_life_years))
  end
end
