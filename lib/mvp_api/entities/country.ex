defmodule MvpApi.Entities.Country do
  use Ecto.Schema
  import Ecto.Changeset

  schema "countries" do
    field :name, :string
    field :code, :string
    field :currency_code, :string
    field :currency_symbol, :string

    timestamps()
  end

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, [
      :name,
      :code,
      :currency_code,
      :currency_symbol
    ])
    |> validate_required([:name, :code])
  end
end
