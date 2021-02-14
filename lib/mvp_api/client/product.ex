defmodule MvpApi.Client.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias MvpApi.Client.Factor

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "products" do
    field :name, :string
    field :final_rating, :decimal, default: 0, virtual: true

    has_many(:factors, Factor, on_replace: :delete)

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name])
    |> cast_assoc(:factors)
    |> validate_required([:name])

    # |> obtain_final_rating()
  end

  # defp obtain_final_rating(changeset) do
  # end
end
