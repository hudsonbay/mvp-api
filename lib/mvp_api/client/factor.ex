defmodule MvpApi.Client.Factor do
  use Ecto.Schema
  import Ecto.Changeset

  alias MvpApi.Client.Product

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "factors" do
    field :name, :string
    field :value, :decimal
    field :weighing, :decimal

    belongs_to(:product, Product)

    timestamps()
  end

  @doc false
  def changeset(factor, attrs) do
    factor
    |> cast(attrs, [:name, :value, :weighing])
    |> validate_required([:name, :value, :weighing])
    |> assoc_constraint(:product)
  end
end
