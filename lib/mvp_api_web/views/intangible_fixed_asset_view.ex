defmodule MvpApiWeb.IntangibleFixedAssetView do
  use MvpApiWeb, :view
  alias MvpApiWeb.IntangibleFixedAssetView

  def render("index.json", %{intangible_fixed_assets: intangible_fixed_assets}) do
    %{data: render_many(intangible_fixed_assets, IntangibleFixedAssetView, "intangible_fixed_asset.json")}
  end

  def render("show.json", %{intangible_fixed_asset: intangible_fixed_asset}) do
    %{data: render_one(intangible_fixed_asset, IntangibleFixedAssetView, "intangible_fixed_asset.json")}
  end

  def render("intangible_fixed_asset.json", %{intangible_fixed_asset: intangible_fixed_asset}) do
    %{id: intangible_fixed_asset.id,
      name: intangible_fixed_asset.name,
      description: intangible_fixed_asset.description}
  end
end
