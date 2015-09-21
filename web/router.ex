defmodule MediaBot.Router do
  use MediaBot.Web, :router
  require PhoenixTokenAuth

  pipeline :authenticated do
    plug PhoenixTokenAuth.Plug
  end

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

  scope "/", MediaBot do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api" do
    pipe_through :api

    PhoenixTokenAuth.mount
  end

  scope "/api" do
    pipe_through :authenticated
    pipe_through :api

    resources "movies", MoviesController
  end

  # Other scopes may use custom stacks.
  # scope "/api", MediaBot do
  #   pipe_through :api
  # end
end
