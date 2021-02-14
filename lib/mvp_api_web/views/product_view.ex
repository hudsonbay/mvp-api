defmodule MvpApiWeb.ProductView do
  use MvpApiWeb, :view
  alias MvpApiWeb.{ProductView, FactorView}

  alias MvpApi.Client.Formulas

  def render("index.json", %{products: products}) do
    %{data: render_many(products, ProductView, "product_with_factors.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ProductView, "product_with_factors.json")}
  end

  def render("product_with_factors.json", %{product: product}) do
    %{
      id: product.id,
      name: product.name,
      factors: render_many(product.factors, FactorView, "factor.json"),
      final_rating: Formulas.final_rating(product.factors)
    }
  end

  # def render("product.json", %{product: product}) do
  #   %{id: product.id, name: product.name}
  # end
end
