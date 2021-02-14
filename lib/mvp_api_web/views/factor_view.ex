defmodule MvpApiWeb.FactorView do
  use MvpApiWeb, :view
  alias MvpApiWeb.FactorView

  def render("index.json", %{factors: factors}) do
    %{data: render_many(factors, FactorView, "factor.json")}
  end

  def render("show.json", %{factor: factor}) do
    %{data: render_one(factor, FactorView, "factor.json")}
  end

  def render("factor.json", %{factor: factor}) do
    %{id: factor.id, name: factor.name, value: factor.value, weighing: factor.weighing}
  end
end
