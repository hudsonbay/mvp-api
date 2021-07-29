defmodule MvpApiWeb.WasteProcessProductView do
  use MvpApiWeb, :view
  alias MvpApiWeb.WasteProcessProductView

  def render("index.json", %{waste_process_products: waste_process_products}) do
    %{data: render_many(waste_process_products, WasteProcessProductView, "waste_process_product.json")}
  end

  def render("show.json", %{waste_process_product: waste_process_product}) do
    %{data: render_one(waste_process_product, WasteProcessProductView, "waste_process_product.json")}
  end

  def render("waste_process_product.json", %{waste_process_product: waste_process_product}) do
    %{id: waste_process_product.id,
      product_name: waste_process_product.product_name,
      um: waste_process_product.um,
      waste_percentage: waste_process_product.waste_percentage,
      price: waste_process_product.price,
      amount: waste_process_product.amount,
      price_recoveral_percentage: waste_process_product.price_recoveral_percentage,
      waste_recovery_by_sale: waste_process_product.waste_recovery_by_sale,
      sale_amount: waste_process_product.sale_amount,
      maximum_admitted_standard: waste_process_product.maximum_admitted_standard,
      environmental_burden: waste_process_product.environmental_burden,
      overload_level: waste_process_product.overload_level}
  end
end
