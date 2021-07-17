defmodule MvpApi.Infrastructure.UtilTool do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [
    :description,
    :quantity,
    :price_per_unit,
    :dedication_percentage,
    :annual_wear_percentage
  ]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "utils_tools" do
    field :annual_cost, Money.Ecto.Composite.Type
    field :annual_wear_percentage, :decimal
    field :dedication_percentage, :decimal
    field :description, :string
    field :price_per_unit, Money.Ecto.Composite.Type
    field :quantity, :integer
    field :total_amount, Money.Ecto.Composite.Type

    timestamps()
  end

  @doc false
  def changeset(util_tool, attrs) do
    util_tool
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_number(:dedication_percentage,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100
    )
    |> validate_number(:annual_wear_percentage,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100
    )
    |> calculate_total_amount()
    |> calculate_annual_cost()
  end

  defp calculate_total_amount(changeset) do
    quantity = get_field(changeset, :quantity)
    price_per_unit = get_field(changeset, :price_per_unit)
    dedication_percentage = get_field(changeset, :dedication_percentage)

    result =
      price_per_unit
      |> Money.mult!(quantity)
      |> Money.mult!(dedication_percentage)
      |> Money.div!(100)

    put_change(changeset, :total_amount, result)
  end

  defp calculate_annual_cost(changeset) do
    dedication_percentage = get_field(changeset, :dedication_percentage)
    annual_wear_percentage = get_field(changeset, :annual_wear_percentage)
    total_amount = get_field(changeset, :total_amount)

    result =
      total_amount
      |> Money.mult!(dedication_percentage)
      |> Money.mult!(annual_wear_percentage)
      |> Money.div!(10_000)

    put_change(changeset, :annual_cost, result)
  end
end
