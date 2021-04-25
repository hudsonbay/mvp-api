defmodule MvpApiWeb.ProcessView do
  use MvpApiWeb, :view
  alias MvpApiWeb.ProcessView
  # alias MvpApiWeb.ProviderView
  # alias MvpApiWeb.IntangibleFixedAssetView

  def render("index.json", %{processes: processes}) do
    %{data: render_many(processes, ProcessView, "process.json")}
  end

  def render("show.json", %{process: process}) do
    %{data: render_one(process, ProcessView, "process.json")}
  end

  def render("process.json", %{process: process}) do
    %{
      id: process.id,
      name: process.name,
      description: process.description
      # providers: render_many(process.providers, ProviderView, "provider.json"),
      # intangible_fixed_assets: render_many(process.intangible_fixed_assets, IntangibleFixedAssetView, "intangible_fixed_asset.json")
    }
  end
end
