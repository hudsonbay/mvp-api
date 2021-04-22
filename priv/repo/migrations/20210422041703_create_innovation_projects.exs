defmodule MvpApi.Repo.Migrations.CreateInnovationProjects do
  use Ecto.Migration

  def change do
    create table(:innovation_projects, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :objective, :string, null: false
      add :expected_result, :string, null: false
      add :budget, :money_with_currency, null: false
      add :term, :decimal, null: false
      add :expected_annual_effect, :money_with_currency, null: false
      add :annual_cost, :money_with_currency
      add :payback_time, :decimal
      add :observation, :text

      timestamps()
    end
  end
end
