defmodule EfoodWeb.CartController do
  use EfoodWeb, :controller
  alias Efood.CartItem

  def index(conn, params) do
    IO.inspect params
    IO.inspect conn
    cart = Repo.all(CartItem)
    render conn, "index.html", cart: cart
  end

  def add(conn, params) do
    IO.inspect params
    IO.inspect conn
    IO.puts "testing"
    conn
    # changeset = CartItem.changeset(%CartItem{}, params)
    # IO.inspect params
    # IO.puts "+++++++++++"
    #
    # Repo.insert(changeset)
    # |> put_flash(:info, "Item Added to Cart")
    # |> redirect(to: Routes.cart_path(conn, :index))
  end

end
