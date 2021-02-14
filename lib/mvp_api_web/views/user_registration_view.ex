defmodule MvpApiWeb.UserRegistrationView do
  use MvpApiWeb, :view

  def render("create.json", %{user: user}) do
    %{
      status: :ok,
      data: %{
        email: user.email,
        inserted_at: user.inserted_at
      },
      message: "Se ha creado un nuevo usuario"
    }
  end

  def render("error.json", %{message: message}) do
    %{
      status: :not_found,
      data: %{},
      message: message
    }
  end
end
