defmodule MvpApi.Providers.ProcessProvider do
  use Ecto.Schema
  import Ecto.Changeset

  alias MvpApi.Providers
  alias MvpApi.Providers.Provider
  alias MvpApi.Processes.Process

  alias Numbers, as: N

  @primary_key false
  @foreign_key_type :binary_id
  schema "process_providers" do
    field :anual_transportation_volume, :float, virtual: true
    field :goods_type, :string
    field :number_supplies_year, :integer
    field :tons_by_supplies, :float

    belongs_to :provider, Provider, primary_key: true
    belongs_to :process, Process, primary_key: true
    # field :provider_id, :id, primary_key: true
    # field :process_id, :id, primary_key: true
  end

  @doc false
  def changeset(process_provider, attrs) do
    process_provider
    |> cast(attrs, [
      :number_supplies_year,
      :tons_by_supplies,
      :goods_type,
      :process_id,
      :provider_id
    ])
    |> validate_required([
      :number_supplies_year,
      :tons_by_supplies,
      :goods_type,
      :process_id,
      :provider_id
    ])
    |> foreign_key_constraint(:process_id)
    |> foreign_key_constraint(:provider_id)
    |> unique_constraint([:provider_id, :process_id], name: :process_id_provider_id_unique_index, message: "already exists")
    |> calculate_anual_transportation_volume()
  end

  defp calculate_anual_transportation_volume(changeset) do
    tons_by_supplies = get_change(changeset, :tons_by_supplies)
    number_supplies_year = get_change(changeset, :number_supplies_year)

    provider =
      changeset
      |> get_change(:provider_id)
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
