defmodule MvpApiWeb.IntangibleFixedAssetProcessView do
  use MvpApiWeb, :view
  alias MvpApiWeb.IntangibleFixedAssetProcessView
  alias MvpApi.Knowledge.Formulas.IntangibleFixedAsset

  def render("index.json", %{intangible_fixed_assets_processes: intangible_fixed_assets_processes}) do
    %{
      total_annual_amortization:
      IntangibleFixedAsset.total_annual_amortization(intangible_fixed_assets_processes),
      data:
        render_many(
          intangible_fixed_assets_processes,
          IntangibleFixedAssetProcessView,
          "intangible_fixed_asset_process.json"
        )
    }
  end

  def render("show.json", %{intangible_fixed_asset_process: intangible_fixed_asset_process}) do
    %{
      data:
        render_one(
          intangible_fixed_asset_process,
          IntangibleFixedAssetProcessView,
          "intangible_fixed_asset_process.json"
        )
    }
  end

  def render("intangible_fixed_asset_process.json", %{
        intangible_fixed_asset_process: intangible_fixed_asset_process
      }) do
    %{
      id: intangible_fixed_asset_process.id,
      amount: intangible_fixed_asset_process.amount,
      dedicated_percentage: intangible_fixed_asset_process.dedicated_percentage,
      initial_value: intangible_fixed_asset_process.initial_value,
      depreciation_rate: intangible_fixed_asset_process.depreciation_rate,
      annual_amortization: intangible_fixed_asset_process.annual_amortization
    }
  end
end
