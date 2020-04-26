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

    get "/", ProductController, :index
    # get "/cart", CartController, :index
    put "/cart", CartController, :update
    resources "products", ProductController
    resources "cart", CartController
  end
end
