defmodule MvpApi.Knowledge.IntangibleFixedAssetProcess do
  use Ecto.Schema
  import Ecto.Changeset

  alias MvpApi.Knowledge.IntangibleFixedAsset
  alias MvpApi.Processes.Process

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "intangible_fixed_assets_processes" do
    field :amount, :integer
    field :annual_amortization, Money.Ecto.Composite.Type
    field :dedicated_percentage, :decimal
    field :depreciation_rate, :decimal
    field :initial_value, Money.Ecto.Composite.Type

    belongs_to :process, Process
    belongs_to :intangible_fixed_asset, IntangibleFixedAsset
  end

  @doc false
  def changeset(intangible_fixed_asset_process, attrs) do
    intangible_fixed_asset_process
    |> cast(attrs, [
      :amount,
      :dedicated_percentage,
      :initial_value,
      :depreciation_rate,
      :process_id,
      :intangible_fixed_asset_id
    ])
    |> validate_required([
      :amount,
      :dedicated_percentage,
      :initial_value,
      :depreciation_rate,
      :process_id,
      :intangible_fixed_asset_id
    ])
    |> foreign_key_constraint(:process_id)
    |> foreign_key_constraint(:intangible_fixed_asset_id)
    |> unique_constraint([:process_id, :intangible_fixed_asset_id],
      name: :intangible_fixed_assets_processes_process_id_intangible_fixed_a,
      message: "already exists"
    )
    |> validate_number(:dedicated_percentage,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100
    )
    |> calculate_annual_amortization()
  end

  def calculate_annual_amortization(changeset) do
    {_, amount} = fetch_field(changeset, :amount)
    {_, dedicated_percentage} = fetch_field(changeset, :dedicated_percentage)
    {_, initial_value} = fetch_field(changeset, :initial_value)
    {_, depreciation_rate} = fetch_field(changeset, :depreciation_rate)

    result =
      initial_value
      |> Money.mult!(amount)
      |> Money.mult!(dedicated_percentage)
      |> Money.mult!(depreciation_rate)
      |> Money.div!(10_000)

    put_change(changeset, :annual_amortization, result)
  end
end
