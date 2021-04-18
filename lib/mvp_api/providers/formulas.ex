defmodule MvpApi.Providers.Formulas do
  alias Numbers, as: N

  @doc """
  Calculates the anual transportation volume of a single provider
  """
  def calculate_anual_transportation_volume(process_provider) do
    process_provider.tons_by_supplies * process_provider.number_supplies_year *
      process_provider.provider.distance_km
  end

  @doc """
  Calculate the total anual transportation volume of a process based on all its providers
  """
  def calculate_total_anual_transportation_volume(process_providers) do
    process_providers
    |> Enum.map(fn x ->
      calculate_anual_transportation_volume(x)
      |> N.to_float()
    end)
    |> Enum.sum()
  end

  @doc """
  Calculates the final evaluation for a provider providing something to a process
  """
  def calculate_final_evaluation(provider_evaluation) do
    (provider_evaluation.punctuality * provider_evaluation.punctuality_weighing +
       provider_evaluation.quality * provider_evaluation.quality_weighing +
       provider_evaluation.credit * provider_evaluation.credit_weighing +
       provider_evaluation.relations * provider_evaluation.relations_weighing +
       provider_evaluation.quantity * provider_evaluation.quantity_weighing) /
      (provider_evaluation.punctuality_weighing + provider_evaluation.quality_weighing +
         provider_evaluation.credit_weighing + provider_evaluation.relations_weighing +
         provider_evaluation.quantity_weighing)
  end

  @doc """
  Calculates the transportation cost using third party providers. If the process provider has no
  transportation schemas asigned then return 0.
  """
  def calculate_transportation_cost_using_third_party_providers(process_provider) do
    case process_provider.transportation_schemas do
      %MvpApi.Providers.TransportationSchema{} ->
        transportation_rate = 0.25
        anual_transportation_volume = calculate_anual_transportation_volume(process_provider)
        percentage = N.div(process_provider.transportation_schemas.using_third, 100)

        anual_transportation_volume_using_third_party_providers =
          percentage |> N.mult(anual_transportation_volume)

        N.mult(transportation_rate, anual_transportation_volume_using_third_party_providers)

      nil ->
        0
    end
  end

  def calculate_total_transportation_cost_using_third_party_providers(process_providers) do
    process_providers
    |> Enum.map(fn x ->
      calculate_transportation_cost_using_third_party_providers(x)
      |> N.to_float()
    end)
    |> Enum.sum()
  end
end
