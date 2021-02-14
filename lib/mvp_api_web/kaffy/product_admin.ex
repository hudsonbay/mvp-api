defmodule MvpApiWeb.Kaffy.ProductAdmin do
  def index(_) do
    [name: %{name: "Nombre"}, final_rating: %{name: "Valoración final"}]
  end

  def form_fields(_) do
    [name: nil]
  end
end
