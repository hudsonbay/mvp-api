defmodule MvpApi.Providers.ProcessProvider do
  use Ecto.Schema
  import Ecto.Changeset

  alias MvpApi.Providers
  alias MvpApi.Providers.{Provider, ProviderEvaluation, TransportationSchema}
  alias MvpApi.Processes.Process

  alias Numbers, as: N

  # @primary_key false
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "process_providers" do
    field :anual_transportation_volume, :float, virtual: true
    field :goods_type, :string
    field :number_supplies_year, :integer
    field :tons_by_supplies, :float

    field :transportation_mode, Ecto.Enum,
      values: [
        :aereo,
        :ferrocarril,
        :automotor,
        :cabotaje,
        :fluvial,
        :tuberia,
        :multimodal,
        :directo,
        :manual,
        :interno
      ]

    belongs_to :provider, Provider
    belongs_to :process, Process

    has_one :provider_evaluation, ProviderEvaluation, on_replace: :delete
    has_one :transportation_schemas, TransportationSchema, on_replace: :delete
  end

  @doc false
  def changeset(process_provider, attrs) do
    process_provider
    |> cast(attrs, [
      :number_supplies_year,
      :tons_by_supplies,
      :goods_type,
      :transportation_mode,
      :process_id,
      :provider_id
    ])
    |> validate_required([
      :number_supplies_year,
      :tons_by_supplies,
      :goods_type,
      :transportation_mode,
      :process_id,
      :provider_id
    ])
    |> cast_assoc(:provider_evaluation)
    |> cast_assoc(:transportation_schemas)
    |> foreign_key_constraint(:process_id)
    |> foreign_key_constraint(:provider_id)
    |> unique_constraint([:provider_id, :process_id],
      name: :process_id_provider_id_unique_index,
      message: "already exists"
    )
    |> calculate_anual_transportation_volume()
  end

  defp calculate_anual_transportation_volume(changeset) do
    tons_by_supplies = get_field(changeset, :tons_by_supplies)
    number_supplies_year = get_field(changeset, :number_supplies_year)

    provider =
      get_field(changeset, :provider_id)
      |> Providers.get_provider!()

    changeset
    |> put_change(
      :anual_transportation_volume,
      tons_by_supplies
      |> N.mult(number_supplies_year)
      |> N.mult(provider.distance_km)
    )
  end
end
