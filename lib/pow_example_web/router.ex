defmodule PowExampleWeb.Router do
  use PowExampleWeb, :router
  use Pow.Phoenix.Router

  pipeline :api do
    plug :accepts, ["json"]
    plug PowExampleWeb.APIAuthPlug, otp_app: :pow_example
  end

  pipeline :api_protected do
    plug Pow.Plug.RequireAuthenticated, error_handler: PowExampleWeb.APIAuthErrorHandler
  end

  scope "/api/v1", PowExampleWeb.API.V1, as: :api_v1 do
    pipe_through :api

    resources "/registration", RegistrationController, singleton: true, only: [:create]
    resources "/session", SessionController, singleton: true, only: [:create, :delete]
    post "/session/renew", SessionController, :renew
  end

  scope "/api/v1", PowExampleWeb.API.V1, as: :api_v1 do
    pipe_through [:api, :api_protected]

    # Your protected API endpoints here
  end
end
