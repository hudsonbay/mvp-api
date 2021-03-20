defmodule MvpApiWeb.ProviderView do
  use MvpApiWeb, :view
  alias MvpApiWeb.ProviderView

  def render("index.json", %{providers: providers}) do
    %{data: render_many(providers, ProviderView, "provider.json")}
  end

  def render("show.json", %{provider: provider}) do
    %{data: render_one(provider, ProviderView, "provider.json")}
  end

  def render("provider.json", %{provider: provider}) do
    %{
      id: provider.id,
      name: provider.name,
      distance_km: provider.distance_km,
      location: provider.location
    }
  end
end
