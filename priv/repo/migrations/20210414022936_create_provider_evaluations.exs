defmodule MvpApi.Repo.Migrations.CreateProviderEvaluations do
  use Ecto.Migration

  def change do
    create table(:provider_evaluations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :punctuality, :integer
      add :punctuality_weighing, :integer
      add :quality, :integer
      add :quality_weighing, :integer
      add :credit, :integer
      add :credit_weighing, :integer
      add :relations, :integer
      add :relations_weighing, :integer
      add :quantity, :integer
      add :quantity_weighing, :integer

      add(
        :process_provider_id,
        references(:process_providers, on_delete: :delete_all, type: :binary_id),
        primary_key: true,
        null: false
      )

      timestamps()
    end

    create index(:provider_evaluations, [:process_provider_id])
  end
end
