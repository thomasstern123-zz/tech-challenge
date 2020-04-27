defmodule EfoodWeb.Router do
  use EfoodWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug EfoodWeb.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EfoodWeb do
    pipe_through :browser

    get "/", ProductController, :index
    get "/products", ProductController, :index
    get "/products/:id", ProductController, :show
    get "/cart", CartController, :index
    get "/cart", CartController, :add

    # resources "products", ProductController
    # resources "cart", CartController
  end

  scope "/auth", EfoodWeb do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    put "/signout", AuthController, :signout
  end
end
