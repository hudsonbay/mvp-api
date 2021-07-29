defmodule MvpApiWeb.EmanationResidualView do
  use MvpApiWeb, :view
  alias MvpApiWeb.EmanationResidualView

  def render("index.json", %{emanation_residuals: emanation_residuals}) do
    %{data: render_many(emanation_residuals, EmanationResidualView, "emanation_residual.json")}
  end

  def render("show.json", %{emanation_residual: emanation_residual}) do
    %{data: render_one(emanation_residual, EmanationResidualView, "emanation_residual.json")}
  end

  def render("emanation_residual.json", %{emanation_residual: emanation_residual}) do
    %{id: emanation_residual.id,
      product_name: emanation_residual.product_name,
      um: emanation_residual.um,
      waste_percentage: emanation_residual.waste_percentage,
      price: emanation_residual.price,
      amount: emanation_residual.amount,
      waste_recovery_by_sale: emanation_residual.waste_recovery_by_sale,
      sale_amount: emanation_residual.sale_amount,
      maximum_admitted_standard: emanation_residual.maximum_admitted_standard,
      environmental_burden: emanation_residual.environmental_burden,
      overload_level: emanation_residual.overload_level}
  end
end
