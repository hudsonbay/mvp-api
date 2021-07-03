defmodule MvpApi.Repo.Migrations.AddCountriesTable do
  use Ecto.Migration

  def change do
    create table(:countries) do
      add :name, :string
      add :code, :string
      add :currency_code, :string
      add :currency_symbol, :string
      timestamps()
    end
  end
end
