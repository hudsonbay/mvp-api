defmodule MvpApi.Providers.Formulas do
  alias Numbers, as: N

  @doc """
  Calculates the anual transportation volume of a single provider
  """
  def calculate_anual_transportation_volume(process_provider) do
    process_provider.tons_by_supplies * process_provider.number_supplies_year *
      process_provider.distance_km
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

  @@doc """
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
end
