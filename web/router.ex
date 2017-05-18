defmodule ElixirWebApp.Router do
  use ElixirWebApp.Web, :router

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

  scope "/", ElixirWebApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/", ElixirWebApp do
    pipe_through :browser

    get "/testPage", PageController, :testPage
  end

  # retreivs static information from model
  scope "/api", ElixirWebApp do
    pipe_through :api

    # resources provides the full set of CRUD actions
    get "/news", NewsController, :getStaticNews
  end

  # calls the external news api
  scope "/api", ElixirWebApp do
    pipe_through :api

    get "/news/external", NewsController, :getExternalNews
  end

end
