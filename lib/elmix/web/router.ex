defmodule Elmix.Web.Router do
  use Elmix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Elmix.Web do
    pipe_through :browser # Use the default browser stack

    get "/page/*path", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", Elmix.Web do
    pipe_through :api
 
    resources "/users", UserController, except: [:new, :edit]
  end
end
