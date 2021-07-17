defmodule MvpApiWeb.Router do
  use MvpApiWeb, :router
  use Kaffy.Routes, scope: "/kaffy"

  import MvpApiWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {MvpApiWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug MvpApiWeb.Plugs.AuthAccessPipeline
  end

  scope "/api", MvpApiWeb, as: :api do
    pipe_through :api

    post "/users/login", SessionController, :create
    post "/users/register", UserRegistrationController, :create
  end

  scope "/", MvpApiWeb do
    pipe_through :browser

    live "/", PageLive, :index
  end

  scope "/api", MvpApiWeb do
    pipe_through [:api, :auth]

    resources "/products", ProductController, except: [:new, :edit] do
      resources "/factors", FactorController, except: [:new, :edit]
    end

    # admin endpoints
    resources "/admin/providers", ProviderController, except: [:new, :edit]

    resources "/admin/intangible_fixed_assets", IntangibleFixedAssetController,
      except: [:new, :edit]

    resources "/admin/tangible_fixed_assets", TangibleFixedAssetController,
      except: [:new, :edit]

    resources "/processes", ProcessController, except: [:new, :edit]
    get "/processes/:process_id/providers", ProviderController, :providers_of_process
    post "/processes/add_provider", ProviderController, :add_provider_to_process
    resources "/provider_evaluations", ProviderEvaluationController, except: [:new, :edit]
    resources "/transportation_schemas", TransportationSchemaController, except: [:new, :edit]
    resources "/innovation_projects", InnovationProjectController, except: [:new, :edit]
    resources "/utils_tools", UtilToolController, except: [:new, :edit]
    resources "/intangible_fixed_asset_processes", IntangibleFixedAssetProcessController,
      except: [:new, :edit]

    get "/processes/:process_id/intangible_fixed_assets",
        IntangibleFixedAssetProcessController,
        :get_intangible_fixed_assets_of_process
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: MvpApiWeb.Telemetry
    end
  end

  ## Authentication routes

  scope "/", MvpApiWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    get "/users/register", UserRegistrationController, :new
    post "/users/register", UserRegistrationController, :create
    get "/users/log_in", UserSessionController, :new
    post "/users/log_in", UserSessionController, :create
    get "/users/reset_password", UserResetPasswordController, :new
    post "/users/reset_password", UserResetPasswordController, :create
    get "/users/reset_password/:token", UserResetPasswordController, :edit
    put "/users/reset_password/:token", UserResetPasswordController, :update
  end

  scope "/", MvpApiWeb do
    pipe_through [:browser, :require_authenticated_user]

    get "/users/settings", UserSettingsController, :edit
    put "/users/settings", UserSettingsController, :update
    get "/users/settings/confirm_email/:token", UserSettingsController, :confirm_email
  end

  scope "/", MvpApiWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete
    get "/users/confirm", UserConfirmationController, :new
    post "/users/confirm", UserConfirmationController, :create
    get "/users/confirm/:token", UserConfirmationController, :confirm
  end
end
