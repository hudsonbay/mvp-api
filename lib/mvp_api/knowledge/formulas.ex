defmodule MvpApi.Knowledge.InnovationProjects.Formulas do
  def total_expected_annual_effect(innovation_projects) do
    sum =
      innovation_projects
      |> Enum.map(fn %{expected_annual_effect: expected_annual_effect} ->
        expected_annual_effect
      end)
      |> Money.sum()

    with {:ok, total} <- sum do
      total
    end
  end

  def total_annual_cost(innovation_projects) do
    sum =
      innovation_projects
      |> Enum.map(fn %{annual_cost: annual_cost} -> annual_cost end)
      |> Money.sum()

    with {:ok, total} <- sum do
      total
    end
  end

  def total_budget(innovation_projects) do
    sum =
      innovation_projects
      |> Enum.map(fn %{budget: budget} -> budget end)
      |> Money.sum()

    with {:ok, total} <- sum do
      total
    end
  end

  def total_payback_time(innovation_projects) do
    total_budget = total_budget(innovation_projects) |> Money.to_decimal()

    total_expected_annual_effect =
      total_expected_annual_effect(innovation_projects) |> Money.to_decimal()

    Decimal.div(total_budget, total_expected_annual_effect)
  end
end