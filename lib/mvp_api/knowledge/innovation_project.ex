defmodule MvpApi.Knowledge.InnovationProject do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "innovation_projects" do
    field :budget, :decimal
    field :expected_anual_effect, :decimal
    field :expected_result, :string
    field :name, :string
    field :objective, :string
    field :observation, :string
    field :term, :decimal

    timestamps()
  end

  @doc false
  def changeset(innovation_project, attrs) do
    innovation_project
    |> cast(attrs, [:name, :objective, :expected_result, :budget, :term, :expected_anual_effect, :observation])
    |> validate_required([:name, :objective, :expected_result, :budget, :term, :expected_anual_effect])
  end
end
