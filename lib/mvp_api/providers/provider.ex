defmodule MvpApi.Providers.Provider do
  use Ecto.Schema
  import Ecto.Changeset

  alias MvpApi.Processes.Process

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "providers" do
    field :distance_km, :integer
    field :location, :string
    field :name, :string

    many_to_many :processes, Process, join_through: "process_providers", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(provider, attrs) do
    provider
    |> cast(attrs, [:name, :location, :distance_km])
    |> validate_required([:name, :location, :distance_km])
    |> unique_constraint([:name])
  end
end
