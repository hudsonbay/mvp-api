defmodule MvpApi.Processes.Process do
  use Ecto.Schema
  import Ecto.Changeset

  alias MvpApi.Providers.Provider

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "processes" do
    field :description, :string
    field :name, :string

    many_to_many :providers, Provider,
      join_through: MvpApi.Providers.ProcessProvider,
      on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(process, attrs) do
    process
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end

  @doc """
  changeset to process module for editing providers (adding the put_assoc/4)
  """
  def changeset_update_providers(%MvpApi.Processes.Process{} = process, providers) do
    process
    |> cast(%{}, [:name, :description])
    # associate providers to the process
    |> put_assoc(:providers, providers)
  end
end
