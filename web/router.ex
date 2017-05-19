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

  scope "/", ElixirWebApp do
    pipe_through :browser

    resources "/articles", PageController
  end

  # Should add an "/user" resource in the "/" scope

  # retreivs static information from model
  scope "/api", ElixirWebApp do
    pipe_through :api

    # resources provides the full set of CRUD actions
    get "/news/static", NewsController, :getStaticNews
  end

  # calls the external news api
  scope "/api", ElixirWebApp do
    pipe_through :api

    get "/news/external", NewsController, :getExternalNews
  end

end
