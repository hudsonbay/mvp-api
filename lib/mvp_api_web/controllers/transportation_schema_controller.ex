defmodule MvpApiWeb.TransportationSchemaController do
  use MvpApiWeb, :controller

  alias MvpApi.Providers
  alias MvpApi.Providers.TransportationSchema

  action_fallback MvpApiWeb.FallbackController

  def index(conn, _params) do
    transportation_schemas = Providers.list_transportation_schemas()
    render(conn, "index.json", transportation_schemas: transportation_schemas)
  end

  def create(conn, %{"transportation_schema" => transportation_schema_params}) do
    with {:ok, %TransportationSchema{} = transportation_schema} <-
           Providers.create_transportation_schema(transportation_schema_params) do
      conn
      |> put_status(:created)
      |> put_resp_header(
        "location",
        Routes.transportation_schema_path(conn, :show, transportation_schema)
      )
      |> render("show.json", transportation_schema: transportation_schema)
    end
  end

  def show(conn, %{"id" => id}) do
    transportation_schema = Providers.get_transportation_schema_process_provider!(id)
    render(conn, "show.json", transportation_schema: transportation_schema)
  end

  def update(conn, %{"id" => id, "transportation_schema" => transportation_schema_params}) do
    transportation_schema = Providers.get_transportation_schema!(id)

    with {:ok, %TransportationSchema{} = transportation_schema} <-
           Providers.update_transportation_schema(
             transportation_schema,
             transportation_schema_params
           ) do
      render(conn, "show.json", transportation_schema: transportation_schema)
    end
  end

  def delete(conn, %{"id" => id}) do
    transportation_schema = Providers.get_transportation_schema!(id)

    with {:ok, %TransportationSchema{}} <-
           Providers.delete_transportation_schema(transportation_schema) do
      send_resp(conn, :no_content, "")
    end
  end
end
