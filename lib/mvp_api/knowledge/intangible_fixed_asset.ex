defmodule MvpApi.Knowledge.IntangibleFixedAsset do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "intangible_fixed_assets" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(intangible_fixed_asset, attrs) do
    intangible_fixed_asset
    |> cast(attrs, [:name, :description])
    |> validate_required([:name])
  end
end
