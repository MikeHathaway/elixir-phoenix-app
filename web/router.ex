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
    # :api for simply sending and receiving JSON
    pipe_through :browser

    get "/testPage", PageController, :testPage
  end

  scope "/api", ElixirWebApp do
    pipe_through :api

    # resources instead of get
    get "/news", NewsController, :retreiveNews
  end

end
