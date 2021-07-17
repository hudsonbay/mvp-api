defmodule MvpApiWeb.UtilToolView do
  use MvpApiWeb, :view
  alias MvpApiWeb.UtilToolView

  def render("index.json", %{utils_tools: utils_tools}) do
    %{data: render_many(utils_tools, UtilToolView, "util_tool.json")}
  end

  def render("show.json", %{util_tool: util_tool}) do
    %{data: render_one(util_tool, UtilToolView, "util_tool.json")}
  end

  def render("util_tool.json", %{util_tool: util_tool}) do
    %{
      id: util_tool.id,
      description: util_tool.description,
      quantity: util_tool.quantity,
      price_per_unit: util_tool.price_per_unit,
      total_amount: util_tool.total_amount,
      dedication_percentage: util_tool.dedication_percentage,
      annual_wear_percentage: util_tool.annual_wear_percentage,
      annual_cost: util_tool.annual_cost
    }
  end
end
