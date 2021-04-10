defmodule MvpApiWeb.ProviderView do
  use MvpApiWeb, :view
  alias MvpApiWeb.ProviderView
  alias MvpApi.Providers.Formulas

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

  def render("show_process_providers.json", %{providers_of_process: providers_of_process}) do
    %{
      total_anual_transportation_volume:
        Formulas.calculate_total_anual_transportation_volume(providers_of_process),
      data:
        render_many(providers_of_process, ProviderView, "process_provider.json",
          as: :process_provider
        )
    }
  end

  def render("process_provider.json", %{process_provider: process_provider}) do
    %{
      process_id: process_provider.process_id,
      provider_id: process_provider.provider_id,
      provider_name: process_provider.provider_name,
      goods_type: process_provider.goods_type,
      number_supplies_year: process_provider.number_supplies_year,
      tons_by_supplies: process_provider.tons_by_supplies,
      distance_km: process_provider.distance_km,
      location: process_provider.location,
      anual_transportation_volume:
        Formulas.calculate_anual_transportation_volume(
          process_provider.tons_by_supplies,
          process_provider.number_supplies_year,
          process_provider.distance_km
        )
    }
  end

  def render("inserted_provider_to_process.json", %{process_provider: process_provider}) do
    %{
      process_id: process_provider.process.id,
      provider_id: process_provider.provider.id,
      provider_name: process_provider.provider.name,
      goods_type: process_provider.goods_type,
      number_supplies_year: process_provider.number_supplies_year,
      tons_by_supplies: process_provider.tons_by_supplies,
      distance_km: process_provider.provider.distance_km,
      location: process_provider.provider.location,
      anual_transportation_volume: process_provider.anual_transportation_volume
    }
  end
end
