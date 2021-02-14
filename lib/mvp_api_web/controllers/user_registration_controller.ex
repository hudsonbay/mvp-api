defmodule MvpApiWeb.UserRegistrationController do
  use MvpApiWeb, :controller

  alias MvpApi.Accounts
  alias MvpApi.Accounts.User
  alias MvpApiWeb.UserAuth

  def new(conn, _params) do
    changeset = Accounts.change_user_registration(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  # def create(conn, %{"user" => user_params}) do
  #   case Accounts.register_user(user_params) do
  #     {:ok, user} ->
  #       {:ok, _} =
  #         Accounts.deliver_user_confirmation_instructions(
  #           user,
  #           &Routes.user_confirmation_url(conn, :confirm, &1)
  #         )

  #       conn
  #       |> put_flash(:info, "User created successfully.")
  #       |> UserAuth.log_in_user(user)

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "new.html", changeset: changeset)
  #   end
  # end

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        conn
        |> put_status(201)
        |> render("create.json", user: user)

      nil ->
        conn
        |> put_status(401)
        |> render("error.json", message: "User could not be created")
    end
  end
end
