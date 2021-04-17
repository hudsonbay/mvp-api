defmodule MvpApi.Repo.Migrations.CreateTransportationSchemas do
  use Ecto.Migration

  def change do
    create table(:transportation_schemas, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :using_own, :decimal
      add :using_provider, :decimal
      add :using_third, :decimal

      add :process_provider_id,
          references(:process_providers, on_delete: :delete_all, type: :binary_id),
          null: false

      timestamps()
    end

    create index(:transportation_schemas, [:process_provider_id])
  end
end
