defmodule MvpApiWeb.ProviderEvaluationController do
  use MvpApiWeb, :controller

  alias MvpApi.Providers
  alias MvpApi.Providers.ProviderEvaluation

  action_fallback MvpApiWeb.FallbackController

  def index(conn, _params) do
    provider_evaluations = Providers.list_provider_evaluations()
    render(conn, "index.json", provider_evaluations: provider_evaluations)
  end

  def create(conn, %{"provider_evaluation" => provider_evaluation_params}) do
    with {:ok, %ProviderEvaluation{} = provider_evaluation} <-
           Providers.create_provider_evaluation(provider_evaluation_params) do
      conn
      |> put_status(:created)
      |> put_resp_header(
        "location",
        Routes.provider_evaluation_path(conn, :show, provider_evaluation)
      )
      |> render("show.json", provider_evaluation: provider_evaluation)
    end
  end

  def show(conn, %{"id" => id}) do
    provider_evaluation = Providers.get_provider_evaluation_process_provider!(id)
    render(conn, "show.json", provider_evaluation: provider_evaluation)
  end

  def update(conn, %{"id" => id, "provider_evaluation" => provider_evaluation_params}) do
    provider_evaluation = Providers.get_provider_evaluation!(id)

    with {:ok, %ProviderEvaluation{} = provider_evaluation} <-
           Providers.update_provider_evaluation(provider_evaluation, provider_evaluation_params) do
      render(conn, "show.json", provider_evaluation: provider_evaluation)
    end
  end

  def delete(conn, %{"id" => id}) do
    provider_evaluation = Providers.get_provider_evaluation!(id)

    with {:ok, %ProviderEvaluation{}} <- Providers.delete_provider_evaluation(provider_evaluation) do
      send_resp(conn, :no_content, "")
    end
  end
end
