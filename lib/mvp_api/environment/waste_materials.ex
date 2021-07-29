defmodule MvpApi.Environment.WasteMaterials do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [
    :product_name,
    :um,
    :waste_percentage,
    :price,
    :price_recoveral_percentage,
    :waste_recovery_by_sale,
    :sale_amount,
    :maximum_admitted_standard,
    :environmental_burden,
    :overload_level
  ]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "waste_materials" do
    field :amount, Money.Ecto.Composite.Type
    field :environmental_burden, :decimal, null: false
    field :maximum_admitted_standard, :decimal, null: false
    field :overload_level, :decimal, null: false
    field :price, Money.Ecto.Composite.Type, null: false
    field :price_recoveral_percentage, :decimal, null: false
    field :product_name, :string, null: false
    field :sale_amount, Money.Ecto.Composite.Type, null: false
    field :um, :string, null: false
    field :waste_percentage, :decimal, null: false
    field :waste_recovery_by_sale, :decimal, null: false

    timestamps()
  end

  @doc false
  def changeset(waste_materials, attrs) do
    waste_materials
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_number(:waste_percentage,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100
    )
    |> validate_number(:price_recoveral_percentage,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100
    )
    |> calculate_amount()
  end

  defp calculate_amount(changeset) do
    price = get_field(changeset, :price)
    environmental_burden = get_field(changeset, :environmental_burden)

    result =
      price
      |> Money.mult!(environmental_burden)

    put_change(changeset, :amount, result)
  end
end
