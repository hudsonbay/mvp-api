defmodule MvpApi.Providers.Formulas do
  alias Numbers, as: N

  def calculate_anual_transportation_volume(process_provider) do
    process_provider.tons_by_supplies * process_provider.number_supplies_year *
      process_provider.distance_km
  end

  def calculate_total_anual_transportation_volume(process_providers) do
    process_providers
    |> Enum.map(fn x ->
      calculate_anual_transportation_volume(x)
      |> N.to_float()
    end)
    |> Enum.sum()
  end

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
