defmodule GerentaskWeb.Router do
  use GerentaskWeb, :router

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

  scope "/", GerentaskWeb do
    pipe_through :browser

    resources "/", TaskController
    post "/:id/conclude", TaskController, :conclude
  end

  # Other scopes may use custom stacks.
  # scope "/api", GerentaskWeb do
  #   pipe_through :api
  # end
end
