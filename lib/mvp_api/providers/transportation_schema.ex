defmodule MvpApi.Providers.TransportationSchema do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "transportation_schemas" do
    field :using_own, :decimal
    field :using_provider, :decimal
    field :using_third, :decimal
    belongs_to :process_provider, MvpApi.Providers.ProcessProvider

    timestamps()
  end

  @doc false
  def changeset(transportation_schema, attrs) do
    transportation_schema
    |> cast(attrs, [:using_own, :using_provider, :using_third, :process_provider_id])
    |> validate_required([:using_own, :using_provider, :using_third, :process_provider_id])
    |> assoc_constraint(:process_provider)
  end
end
