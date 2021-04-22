defmodule MvpApiWeb.InnovationProjectView do
  use MvpApiWeb, :view
  alias MvpApiWeb.InnovationProjectView
  alias MvpApi.Knowledge.InnovationProjects.Formulas

  def render("index.json", %{innovation_projects: innovation_projects}) do
    %{data: render_many(innovation_projects, InnovationProjectView, "innovation_project.json")}
  end

  def render("show.json", %{innovation_project: innovation_project}) do
    %{data: render_one(innovation_project, InnovationProjectView, "innovation_project.json")}
  end

  def render("innovation_project.json", %{innovation_project: innovation_project}) do
    %{
      id: innovation_project.id,
      name: innovation_project.name,
      objective: innovation_project.objective,
      expected_result: innovation_project.expected_result,
      budget: innovation_project.budget,
      term: innovation_project.term,
      expected_annual_effect: innovation_project.expected_annual_effect,
      observation: innovation_project.observation,
      annual_cost: innovation_project.annual_cost,
      payback_time: innovation_project.payback_time
    }
  end
end
