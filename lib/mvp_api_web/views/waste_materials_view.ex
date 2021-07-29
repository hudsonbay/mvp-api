defmodule MvpApiWeb.WasteMaterialsView do
  use MvpApiWeb, :view
  alias MvpApiWeb.WasteMaterialsView

  def render("index.json", %{waste_materials: waste_materials}) do
    %{data: render_many(waste_materials, WasteMaterialsView, "waste_materials.json")}
  end

  def render("show.json", %{waste_materials: waste_materials}) do
    %{data: render_one(waste_materials, WasteMaterialsView, "waste_materials.json")}
  end

  def render("waste_materials.json", %{waste_materials: waste_materials}) do
    %{id: waste_materials.id,
      product_name: waste_materials.product_name,
      um: waste_materials.um,
      waste_percentage: waste_materials.waste_percentage,
      price: waste_materials.price,
      amount: waste_materials.amount,
      price_recoveral_percentage: waste_materials.price_recoveral_percentage,
      waste_recovery_by_sale: waste_materials.waste_recovery_by_sale,
      sale_amount: waste_materials.sale_amount,
      maximum_admitted_standard: waste_materials.maximum_admitted_standard,
      environmental_burden: waste_materials.environmental_burden,
      overload_level: waste_materials.overload_level}
  end
end
