defmodule MvpApiWeb.ActionView do
  use MvpApiWeb, :view
  alias MvpApiWeb.ActionView

  def render("index.json", %{protection_actions: protection_actions}) do
    %{data: render_many(protection_actions, ActionView, "action.json")}
  end

  def render("show.json", %{action: action}) do
    %{data: render_one(action, ActionView, "action.json")}
  end

  def render("action.json", %{action: action}) do
    %{
      id: action.id,
      name: action.name,
      resource: action.resource,
      quantity: action.quantity,
      price_per_unit: action.price_per_unit,
      useful_life_months: action.useful_life_months,
      monthly_payment: action.monthly_payment,
      annual_cost: action.annual_cost,
      observations: action.observations
    }
  end
end
