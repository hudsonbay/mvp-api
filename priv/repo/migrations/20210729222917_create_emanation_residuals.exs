defmodule MvpApi.Repo.Migrations.CreateEmanationResiduals do
  use Ecto.Migration

  def change do
    create table(:emanation_residuals, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :product_name, :string, null: false
      add :um, :string, null: false
      add :waste_percentage, :decimal, null: false
      add :price, :money_with_currency, null: false
      add :amount, :money_with_currency, null: false
      add :waste_recovery_by_sale, :decimal, null: false
      add :sale_amount, :money_with_currency, null: false
      add :maximum_admitted_standard, :decimal, null: false
      add :environmental_burden, :decimal, null: false
      add :overload_level, :decimal, null: false

      timestamps()
    end

  end
end
