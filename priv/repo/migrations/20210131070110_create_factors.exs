defmodule MvpApi.Repo.Migrations.CreateFactors do
  use Ecto.Migration

  def change do
    create table(:factors, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :value, :decimal, null: false
      add :weighing, :decimal, null: false

      add :product_id, references(:products, on_delete: :delete_all, type: :binary_id),
        null: false

      timestamps()
    end

    create index(:factors, [:product_id])
  end
end
