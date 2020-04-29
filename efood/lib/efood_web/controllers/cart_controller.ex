defmodule EfoodWeb.CartController do
  @moduledoc """
  Controller for managing cart items.
  """

  use EfoodWeb, :controller
  alias Efood.CartItem
  alias Efood.Product

  plug EfoodWeb.Plugs.RequireAuth when action in [:update, :delete]

  @doc """
  Renders cart/show.htlm displaying all objects in the cart
  """
  def show(conn, _params) do
    cart = Repo.all(CartItem)
    render(conn, "show.html", cart: cart)
  end

  defp _add_item(conn) do
    product_id = get_session(conn, :product_id)
    product_name = Repo.get(Product, product_id).product_name
    changeset = CartItem.changeset(%CartItem{}, %{"product_name" => product_name})
    Repo.insert(changeset)
    conn
  end

  @doc """
  Adds new product to current user's cart.
  """
  def update(conn, _params) do
    %{"product_id" => product_id} = conn.private.plug_session

    conn
    |> _add_item
    |> put_flash(:info, "Product Added to Cart")
    |> redirect(to: Routes.product_path(conn, :show, product_id))
  end

  @doc """
  Deletes product from current user's cart.
  """
  def delete(conn, _params) do
    %{"id" => product_id} = conn.params
    Repo.get!(CartItem, product_id) |> Repo.delete!()

    conn
    |> put_flash(:info, "Product Removed from Cart")
    |> redirect(to: Routes.cart_path(conn, :show, conn.assigns.user.id))
  end
end
