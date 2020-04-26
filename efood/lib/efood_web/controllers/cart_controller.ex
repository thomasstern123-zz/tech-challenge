defmodule EfoodWeb.CartController do
  use EfoodWeb, :controller
  alias Efood.CartItem

  def index(conn, _params) do
    cart = Repo.all(CartItem)

    render conn, "index.html", cart: cart
  end

  def update(conn, params = %{"product_name" => product_name, "product_quantity" => 1}) do
    changeset = CartItem.changeset(%CartItem{}, params)
    IO.inspect params
    IO.puts "+++++++++++"

    Repo.insert(changeset)
    |> put_flash(:info, "Item Added to Cart")
    |> redirect(to: Routes.cart_path(conn, :index))
  end

end
