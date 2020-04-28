defmodule EfoodWeb.CartController do
  use EfoodWeb, :controller
  alias Efood.CartItem
  alias Efood.Product

  plug EfoodWeb.Plugs.RequireAuth when action in [:update]

  def show(conn, params) do
    cart = Repo.all(CartItem)
    render conn, "index.html", cart: cart
  end

  defp add_item(conn) do
    product_id = get_session(conn, :product_id)
    product_name = Repo.get(Product, product_id).product_name
    changeset = CartItem.changeset(%CartItem{}, %{"product_name" => product_name})
    Repo.insert(changeset)
  end

  def update(conn, params) do
    IO.puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    IO.inspect conn
    conn
    |> add_item
    conn
    |> put_flash(:info, "Product Added to Cart")
    # |> redirect(to: Routes.cart_path(conn, :show, conn.assigns.user.id)) #cart
    # |> redirect(to: Routes.product_path(conn, :index)) #product
    |> redirect(to: Routes.product_path(conn, :show, conn.assigns.user.id)) #index
  end

  def delete(conn, _params) do
    %{"id" => product_id} = conn.params
    Repo.get!(CartItem, product_id) |> Repo.delete!

    conn
    |> put_flash(:info, "Product Removed from Cart")
    |> redirect(to: Routes.cart_path(conn, :show, conn.assigns.user.id))
  end
end
