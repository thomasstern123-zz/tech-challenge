defmodule EfoodWeb.Router do
  use EfoodWeb, :router

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

  scope "/", EfoodWeb do
    pipe_through :browser

    resources "/", ProductController, except: [:index]
    get "/", ProductController, :index
    get "/products/:id", ProductController, :show
  end
end
