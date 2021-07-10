defmodule MvpApi.Repo.Migrations.CreateTangibleFixedAssets do
  use Ecto.Migration

  def change do
    create table(:tangible_fixed_assets, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :inventory_number, :string, null: false
      add :description, :string, null: false
      add :dedicated_percentage, :decimal, null: false
      add :quantity, :integer, null: false
      add :purchase_price, :money_with_currency, null: false
      add :total_value, :money_with_currency, null: false
      add :depreciation_rate, :decimal, null: false
      add :annual_depreciation, :money_with_currency, null: false
      add :classification, :string, null: false

      timestamps()
    end
  end
end
