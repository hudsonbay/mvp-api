defmodule MvpApi.Providers.Formulas do
  alias Numbers, as: N

  def calculate_anual_transportation_volume(tons_by_supplies, number_supplies_year, distance_km) do
    tons_by_supplies * number_supplies_year * distance_km
  end

  def calculate_total_anual_transportation_volume(process_providers) do
    process_providers
    |> Enum.map(fn %{
                     tons_by_supplies: tons_by_supplies,
                     number_supplies_year: number_supplies_year,
                     distance_km: distance_km
                   } ->
      calculate_anual_transportation_volume(tons_by_supplies, number_supplies_year, distance_km)
      |> N.to_float()
    end)
    |> Enum.sum()
  end
end
