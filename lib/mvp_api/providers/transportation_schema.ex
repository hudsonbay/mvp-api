defmodule MvpApi.Providers.TransportationSchema do
  use Ecto.Schema
  import Ecto.Changeset

  alias Numbers, as: N

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "transportation_schemas" do
    field :using_own, :decimal, default: 0
    field :using_provider, :decimal, default: 0
    field :using_third, :decimal, default: 0
    field :sum, :decimal, virtual: true, default: 0
    belongs_to :process_provider, MvpApi.Providers.ProcessProvider

    timestamps()
  end

  @doc false
  def changeset(transportation_schema, attrs) do
    transportation_schema
    |> cast(attrs, [:using_own, :using_provider, :using_third, :process_provider_id])
    |> validate_required([:using_own, :using_provider, :using_third, :process_provider_id])
    |> assoc_constraint(:process_provider)
    |> validate_number(:using_own, greater_than_or_equal_to: 0, less_than_or_equal_to: 100)
    |> validate_number(:using_provider, greater_than_or_equal_to: 0, less_than_or_equal_to: 100)
    |> validate_number(:using_third, greater_than_or_equal_to: 0, less_than_or_equal_to: 100)
    |> validate_sum_100()
  end

  defp validate_sum_100(changeset) do
    using_own = get_field(changeset, :using_own)
    using_provider = get_field(changeset, :using_provider)
    using_third = get_field(changeset, :using_third)

    sum = using_own |> N.add(using_provider) |> N.add(using_third)

    if Decimal.equal?(sum, 100) do
      changeset
    else
      add_error(changeset, :sum, "Must be equal to 100")
    end
  end
end
