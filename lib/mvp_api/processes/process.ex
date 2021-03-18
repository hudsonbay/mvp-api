defmodule MvpApi.Processes.Process do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "processes" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(process, attrs) do
    process
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
