defmodule MvpApi.Knowledge.InnovationProjects.Formulas do

  @doc """
  Calculates anual cost
  """
  def calculate_annual_cost(innovation_project) do
    with {:ok, cost} <- Money.div(innovation_project.budget, innovation_project.term) do
      cost
    else
      {:error,  reason} ->
      reason
    end
  end
end
