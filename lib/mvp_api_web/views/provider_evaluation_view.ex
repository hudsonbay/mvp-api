defmodule MvpApiWeb.ProviderEvaluationView do
  use MvpApiWeb, :view
  alias MvpApiWeb.ProviderEvaluationView
  alias MvpApi.Providers.Formulas

  def render("index.json", %{provider_evaluations: provider_evaluations}) do
    %{data: render_many(provider_evaluations, ProviderEvaluationView, "provider_evaluation.json")}
  end

  def render("show.json", %{provider_evaluation: provider_evaluation}) do
    %{data: render_one(provider_evaluation, ProviderEvaluationView, "provider_evaluation.json")}
  end

  def render("provider_evaluation.json", %{provider_evaluation: provider_evaluation}) do
    %{
      id: provider_evaluation.id,
      process_provider_id: provider_evaluation.process_provider_id,
      punctuality: provider_evaluation.punctuality,
      punctuality_weighing: provider_evaluation.punctuality_weighing,
      quality: provider_evaluation.quality,
      quality_weighing: provider_evaluation.quality_weighing,
      credit: provider_evaluation.credit,
      credit_weighing: provider_evaluation.credit_weighing,
      relations: provider_evaluation.relations,
      relations_weighing: provider_evaluation.relations_weighing,
      quantity: provider_evaluation.quantity,
      quantity_weighing: provider_evaluation.quantity_weighing,
      final_evaluation: Formulas.calculate_final_evaluation(provider_evaluation)
    }
  end
end
