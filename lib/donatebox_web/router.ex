defmodule DonateboxWeb.Router do
  use DonateboxWeb, :router

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

  scope "/", DonateboxWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", AuthenticationController, :index
    post "/login", AuthenticationController, :log
    get "/register", AuthenticationController, :register
    get "/delete", AuthenticationController, :delete
    post "/register", AuthenticationController, :createuser
    get "/profile", PageController, :profile
    get "/editprofile", PageController, :editprofile
    post "/editprofile", PageController, :profileupdate
    get "/donate", PageController, :donate
    post "/donate", PageController, :givedonation

    get "/admin", AdminController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", DonateboxWeb do
  #   pipe_through :api
  # end
end
