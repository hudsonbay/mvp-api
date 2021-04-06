defmodule MvpApi.Providers.Formulas do
  def calculate_anual_transportation_volume(tons_by_supplies, number_supplies_year, distance_km) do
    tons_by_supplies * number_supplies_year * distance_km
  end
end
