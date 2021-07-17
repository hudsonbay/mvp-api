defmodule MvpApi.Repo.Migrations.CreateControlPoints do
  use Ecto.Migration

  def change do
    create table(:control_points, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :variable_to_control, :string, null: false
      add :instrument, :string, null: false
      add :precision, :string, null: false
      add :quantity, :integer, null: false
      add :dedicated_percentage, :decimal, null: false
      add :price_per_unit, :money_with_currency, null: false
      add :total_amount, :money_with_currency, null: false
      add :useful_life_years, :integer, null: false
      add :verification_frequency_months, :integer, null: false
      add :price_per_verification, :money_with_currency, null: false
      add :annual_cost_verification, :money_with_currency, null: false
      add :executor, :string, null: false
      add :annual_total_expense, :money_with_currency, null: false

      timestamps()
    end

  end
end
