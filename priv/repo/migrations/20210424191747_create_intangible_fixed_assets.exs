defmodule MvpApi.Repo.Migrations.CreateIntangibleFixedAssets do
  use Ecto.Migration

  def change do
    create table(:intangible_fixed_assets, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :description, :text

      timestamps()
    end

  end
end
