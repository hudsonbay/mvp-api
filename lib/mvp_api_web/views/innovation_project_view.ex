defmodule MvpApiWeb.InnovationProjectView do
  use MvpApiWeb, :view
  alias MvpApiWeb.InnovationProjectView

  def render("index.json", %{innovation_projects: innovation_projects}) do
    %{data: render_many(innovation_projects, InnovationProjectView, "innovation_project.json")}
  end

  def render("show.json", %{innovation_project: innovation_project}) do
    %{data: render_one(innovation_project, InnovationProjectView, "innovation_project.json")}
  end

  def render("innovation_project.json", %{innovation_project: innovation_project}) do
    %{id: innovation_project.id,
      name: innovation_project.name,
      objective: innovation_project.objective,
      expected_result: innovation_project.expected_result,
      budget: innovation_project.budget,
      term: innovation_project.term,
      expected_anual_effect: innovation_project.expected_anual_effect,
      observation: innovation_project.observation}
  end
end
