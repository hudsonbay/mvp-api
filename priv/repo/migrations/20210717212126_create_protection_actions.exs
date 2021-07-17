defmodule MvpApi.Repo.Migrations.CreateProtectionActions do
  use Ecto.Migration

  def change do
    create table(:protection_actions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :resource, :string, null: false
      add :quantity, :integer, null: false
      add :price_per_unit, :money_with_currency, null: false
      add :useful_life_months, :integer, null: false
      add :monthly_payment, :money_with_currency, null: false
      add :annual_cost, :money_with_currency, null: false
      add :observations, :string

      timestamps()
    end
  end
end
