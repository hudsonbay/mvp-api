defmodule MvpApiWeb.ProviderView do
  use MvpApiWeb, :view
  alias MvpApiWeb.{ProviderView, ProcessView, ProviderEvaluationView, TransportationSchemaView}
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
      total_transportation_cost_using_third_party_providers:
        Formulas.calculate_total_transportation_cost_using_third_party_providers(
          providers_of_process
        ),
      data:
        render_many(providers_of_process, ProviderView, "process_provider.json",
          as: :process_provider
        )
    }
  end

  def render("process_provider.json", %{process_provider: process_provider}) do
    %{
      provider: render_one(process_provider.provider, ProviderView, "provider.json"),
      process: render_one(process_provider.process, ProcessView, "process.json"),
      provider_evaluation:
        render_one(
          process_provider.provider_evaluation,
          ProviderEvaluationView,
          "provider_evaluation.json"
        ),
      transportation_schema:
        render_one(
          process_provider.transportation_schemas,
          TransportationSchemaView,
          "transportation_schema.json"
        ),
      transportation_cost_using_third_party_providers:
        Formulas.calculate_transportation_cost_using_third_party_providers(process_provider),
      process_provider_id: process_provider.id,
      goods_type: process_provider.goods_type,
      number_supplies_year: process_provider.number_supplies_year,
      tons_by_supplies: process_provider.tons_by_supplies,
      transportation_mode: process_provider.transportation_mode,
      anual_transportation_volume:
        Formulas.calculate_anual_transportation_volume(process_provider)
    }
  end
end
