defmodule MvpApi.Infrastructure.TangibleFixedAsset do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tangible_fixed_assets" do
    field :annual_depreciation, Money.Ecto.Composite.Type
    field :classification, :string
    field :dedicated_percentage, :decimal
    field :depreciation_rate, :decimal
    field :description, :string
    field :inventory_number, :string
    field :purchase_price, Money.Ecto.Composite.Type
    field :quantity, :integer
    field :total_value, Money.Ecto.Composite.Type

    timestamps()
  end

  @doc false
  def changeset(tangible_fixed_asset, attrs) do
    tangible_fixed_asset
    |> cast(attrs, [
      :inventory_number,
      :description,
      :dedicated_percentage,
      :quantity,
      :purchase_price,
      :depreciation_rate,
      :classification
    ])
    |> validate_required([
      :inventory_number,
      :description,
      :dedicated_percentage,
      :quantity,
      :purchase_price,
      :depreciation_rate,
      :classification
    ])
    |> validate_number(:dedicated_percentage,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100
    )
    |> calculate_total_value()
    |> calculate_annual_depreciation()
  end

  defp calculate_total_value(changeset) do
    quantity = get_field(changeset, :quantity)
    purchase_price = get_field(changeset, :purchase_price)

    put_change(changeset, :total_value, Money.mult!(purchase_price, quantity))
  end

  defp calculate_annual_depreciation(changeset) do
    dedicated_percentage = get_field(changeset, :dedicated_percentage)
    total_value = get_field(changeset, :total_value)
    depreciation_rate = get_field(changeset, :depreciation_rate)

    result =
      total_value
      |> Money.mult!(dedicated_percentage)
      |> Money.mult!(depreciation_rate)
      |> Money.div!(1_000)

    put_change(changeset, :annual_depreciation, result)
  end
end
