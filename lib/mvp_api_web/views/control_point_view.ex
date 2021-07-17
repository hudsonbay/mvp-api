defmodule MvpApiWeb.ControlPointView do
  use MvpApiWeb, :view
  alias MvpApiWeb.ControlPointView

  def render("index.json", %{control_points: control_points}) do
    %{data: render_many(control_points, ControlPointView, "control_point.json")}
  end

  def render("show.json", %{control_point: control_point}) do
    %{data: render_one(control_point, ControlPointView, "control_point.json")}
  end

  def render("control_point.json", %{control_point: control_point}) do
    %{
      id: control_point.id,
      name: control_point.name,
      variable_to_control: control_point.variable_to_control,
      instrument: control_point.instrument,
      precision: control_point.precision,
      quantity: control_point.quantity,
      dedicated_percentage: control_point.dedicated_percentage,
      price_per_unit: control_point.price_per_unit,
      total_amount: control_point.total_amount,
      useful_life_years: control_point.useful_life_years,
      verification_frequency_months: control_point.verification_frequency_months,
      price_per_verification: control_point.price_per_verification,
      annual_cost_verification: control_point.annual_cost_verification,
      executor: control_point.executor,
      annual_total_expense: control_point.annual_total_expense
    }
  end
end
