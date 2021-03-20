defmodule MvpApi.Repo.Migrations.CreateProviders do
  use Ecto.Migration

  def change do
    create table(:providers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :location, :string
      add :distance_km, :integer

      timestamps()
    end

    create(unique_index(:providers, [:name]))
  end
end
