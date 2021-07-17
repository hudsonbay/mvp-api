defmodule MvpApi.Repo.Migrations.CreateUtilsTools do
  use Ecto.Migration

  def change do
    create table(:utils_tools, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :description, :string, null: false
      add :quantity, :integer, null: false
      add :price_per_unit, :money_with_currency, null: false
      add :total_amount, :money_with_currency, null: false
      add :dedication_percentage, :decimal, null: false
      add :annual_wear_percentage, :decimal, null: false
      add :annual_cost, :money_with_currency, null: false

      timestamps()
    end

  end
end
