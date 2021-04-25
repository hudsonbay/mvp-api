defmodule MvpApi.Repo.Migrations.CreateIntangibleFixedAssetsProcesses do
  use Ecto.Migration

  def change do
    create table(:intangible_fixed_assets_processes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :amount, :integer, null: false
      add :dedicated_percentage, :decimal, null: false
      add :initial_value, :money_with_currency, null: false
      add :depreciation_rate, :decimal, null: false
      add :annual_amortization, :money_with_currency

      add(:process_id, references(:processes, on_delete: :delete_all, type: :binary_id),
        null: false
      )

      add(
        :intangible_fixed_asset_id,
        references(:intangible_fixed_assets, on_delete: :delete_all, type: :binary_id),
        null: false
      )
    end

    create index(:intangible_fixed_assets_processes, [:process_id])
    create index(:intangible_fixed_assets_processes, [:intangible_fixed_asset_id])

    create unique_index(:intangible_fixed_assets_processes, [
             :process_id,
             :intangible_fixed_asset_id
           ])
  end
end
