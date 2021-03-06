defmodule MvpApi.Repo.Migrations.CreateProcessProviders do
  use Ecto.Migration

  def change do
    create table(:process_providers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :number_supplies_year, :integer, null: false
      add :tons_by_supplies, :float, null: false
      add :goods_type, :string, null: false
      add :transportation_mode, :string, null: false

      add(:provider_id, references(:providers, on_delete: :delete_all, type: :binary_id),
        null: false
      )

      add(:process_id, references(:processes, on_delete: :delete_all, type: :binary_id),
        null: false
      )
    end

    create index(:process_providers, [:provider_id])
    create index(:process_providers, [:process_id])
    create unique_index(:process_providers, [:process_id, :provider_id])
  end
end
