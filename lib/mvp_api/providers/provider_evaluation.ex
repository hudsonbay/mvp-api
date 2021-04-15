defmodule MvpApi.Providers.ProviderEvaluation do
  use Ecto.Schema
  import Ecto.Changeset

  alias MvpApi.Providers.ProcessProvider

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "provider_evaluations" do
    field :credit, :integer
    field :credit_weighing, :integer
    field :punctuality, :integer
    field :punctuality_weighing, :integer
    field :quality, :integer
    field :quality_weighing, :integer
    field :quantity, :integer
    field :quantity_weighing, :integer
    field :relations, :integer
    field :relations_weighing, :integer

    belongs_to :process_provider, ProcessProvider

    timestamps()
  end

  @doc false
  def changeset(provider_evaluation, attrs) do
    provider_evaluation
    |> cast(attrs, [
      :punctuality,
      :punctuality_weighing,
      :quality,
      :quality_weighing,
      :credit,
      :credit_weighing,
      :relations,
      :relations_weighing,
      :quantity,
      :quantity_weighing,
      :process_provider_id
    ])
    |> validate_required([
      :punctuality,
      :punctuality_weighing,
      :quality,
      :quality_weighing,
      :credit,
      :credit_weighing,
      :relations,
      :relations_weighing,
      :quantity,
      :quantity_weighing,
      :process_provider_id
    ])
  end
end
