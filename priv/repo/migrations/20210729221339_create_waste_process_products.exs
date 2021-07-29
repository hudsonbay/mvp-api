defmodule MvpApi.Repo.Migrations.CreateWasteProcessProducts do
  use Ecto.Migration

  def change do
    create table(:waste_process_products, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :product_name, :string, null: false
      add :um, :string, null: false
      add :waste_percentage, :decimal, null: false
      add :price, :money_with_currency, null: false
      add :amount, :money_with_currency, null: false
      add :price_recoveral_percentage, :decimal, null: false
      add :waste_recovery_by_sale, :decimal, null: false
      add :sale_amount, :money_with_currency, null: false
      add :maximum_admitted_standard, :decimal, null: false
      add :environmental_burden, :decimal, null: false
      add :overload_level, :decimal, null: false

      timestamps()
    end

  end
end
