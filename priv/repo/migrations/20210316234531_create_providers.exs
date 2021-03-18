defmodule MvpApi.Repo.Migrations.CreateProviders do
  use Ecto.Migration

  def change do
    create table(:providers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :location, :string
      add :distance, :string

      timestamps()
    end

  end
end
