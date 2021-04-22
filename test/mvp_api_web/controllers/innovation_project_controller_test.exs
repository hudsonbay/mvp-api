defmodule MvpApiWeb.InnovationProjectControllerTest do
  use MvpApiWeb.ConnCase

  alias MvpApi.Knowledge
  alias MvpApi.Knowledge.InnovationProject

  @create_attrs %{
    budget: "120.5",
    expected_annual_effect: "120.5",
    expected_result: "some expected_result",
    name: "some name",
    objective: "some objective",
    observation: "some observation",
    term: "120.5"
  }
  @update_attrs %{
    budget: "456.7",
    expected_annual_effect: "456.7",
    expected_result: "some updated expected_result",
    name: "some updated name",
    objective: "some updated objective",
    observation: "some updated observation",
    term: "456.7"
  }
  @invalid_attrs %{
    budget: nil,
    expected_annual_effect: nil,
    expected_result: nil,
    name: nil,
    objective: nil,
    observation: nil,
    term: nil
  }

  def fixture(:innovation_project) do
    {:ok, innovation_project} = Knowledge.create_innovation_project(@create_attrs)
    innovation_project
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all innovation_projects", %{conn: conn} do
      conn = get(conn, Routes.innovation_project_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create innovation_project" do
    test "renders innovation_project when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.innovation_project_path(conn, :create),
          innovation_project: @create_attrs
        )

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.innovation_project_path(conn, :show, id))

      assert %{
               "id" => id,
               "budget" => "120.5",
               "expected_annual_effect" => "120.5",
               "expected_result" => "some expected_result",
               "name" => "some name",
               "objective" => "some objective",
               "observation" => "some observation",
               "term" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.innovation_project_path(conn, :create),
          innovation_project: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update innovation_project" do
    setup [:create_innovation_project]

    test "renders innovation_project when data is valid", %{
      conn: conn,
      innovation_project: %InnovationProject{id: id} = innovation_project
    } do
      conn =
        put(conn, Routes.innovation_project_path(conn, :update, innovation_project),
          innovation_project: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.innovation_project_path(conn, :show, id))

      assert %{
               "id" => id,
               "budget" => "456.7",
               "expected_annual_effect" => "456.7",
               "expected_result" => "some updated expected_result",
               "name" => "some updated name",
               "objective" => "some updated objective",
               "observation" => "some updated observation",
               "term" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      innovation_project: innovation_project
    } do
      conn =
        put(conn, Routes.innovation_project_path(conn, :update, innovation_project),
          innovation_project: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete innovation_project" do
    setup [:create_innovation_project]

    test "deletes chosen innovation_project", %{
      conn: conn,
      innovation_project: innovation_project
    } do
      conn = delete(conn, Routes.innovation_project_path(conn, :delete, innovation_project))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.innovation_project_path(conn, :show, innovation_project))
      end
    end
  end

  defp create_innovation_project(_) do
    innovation_project = fixture(:innovation_project)
    %{innovation_project: innovation_project}
  end
end
