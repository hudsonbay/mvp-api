defmodule MvpApiWeb.TransportationSchemaView do
  use MvpApiWeb, :view
  alias MvpApiWeb.TransportationSchemaView

  def render("index.json", %{transportation_schemas: transportation_schemas}) do
    %{
      data:
        render_many(
          transportation_schemas,
          TransportationSchemaView,
          "transportation_schema.json"
        )
    }
  end

  def render("show.json", %{transportation_schema: transportation_schema}) do
    %{
      data:
        render_one(transportation_schema, TransportationSchemaView, "transportation_schema.json")
    }
  end

  def render("transportation_schema.json", %{transportation_schema: transportation_schema}) do
    %{
      id: transportation_schema.id,
      using_own: transportation_schema.using_own,
      using_provider: transportation_schema.using_provider,
      using_third: transportation_schema.using_third
    }
  end
end
