defmodule EfoodWeb.ProductController do
  @moduledoc """
  Controller for managing product items.
  """

  use EfoodWeb, :controller
  alias Efood.Product
  import Ecto.Query, only: [from: 2]

  plug EfoodWeb.Plugs.SetProduct when action in [:show]

  @doc """
  Renders product/index.html displaying product catalog.
  """
  def index(conn, params) do
    products = _list_products(params)
    render(conn, "index.html", products: products)
  end

  @doc """
  Renders product/show.html displaying selected product with:\n
    -product_name\n
    -categories\n
    -url
  """
  def show(conn, %{"id" => product_id}) do
    product = Repo.get!(Product, product_id)
    render(conn, "show.html", product: product)
  end

  defp _list_products(params) do
    search_term = get_in(params, ["query"])

    Product
    |> _search(search_term)
    |> Repo.all()
  end

  defp _search(query, search_term) do
    wildcard_search = "%#{search_term}%"

    from product in query,
      where: ilike(product.product_name, ^wildcard_search),
      or_where: ilike(product.categories, ^wildcard_search),
      or_where: ilike(product.url, ^wildcard_search)
  end
end
