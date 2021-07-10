defmodule MvpApiWeb.TangibleFixedAssetView do
  use MvpApiWeb, :view
  alias MvpApiWeb.TangibleFixedAssetView

  def render("index.json", %{tangible_fixed_assets: tangible_fixed_assets}) do
    %{
      data:
        render_many(tangible_fixed_assets, TangibleFixedAssetView, "tangible_fixed_asset.json")
    }
  end

  def render("show.json", %{tangible_fixed_asset: tangible_fixed_asset}) do
    %{data: render_one(tangible_fixed_asset, TangibleFixedAssetView, "tangible_fixed_asset.json")}
  end

  def render("tangible_fixed_asset.json", %{tangible_fixed_asset: tangible_fixed_asset}) do
    %{
      id: tangible_fixed_asset.id,
      inventory_number: tangible_fixed_asset.inventory_number,
      description: tangible_fixed_asset.description,
      dedicated_percentage: tangible_fixed_asset.dedicated_percentage,
      quantity: tangible_fixed_asset.quantity,
      purchase_price: tangible_fixed_asset.purchase_price,
      total_value: tangible_fixed_asset.total_value,
      depreciation_rate: tangible_fixed_asset.depreciation_rate,
      annual_depreciation: tangible_fixed_asset.annual_depreciation,
      classification: tangible_fixed_asset.classification
    }
  end
end
