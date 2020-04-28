defmodule EfoodWeb.ProductController do
  use EfoodWeb, :controller
  alias Efood.Product
  import Ecto.Query, only: [from: 2]

  plug EfoodWeb.Plugs.SetProduct when action in [:show]

  def index(conn, params) do
    products = list_products(params)
    render conn, "index.html", products: products
  end

  def show(conn, %{"id" => product_id}) do
    product = Repo.get!(Product, product_id)
    render conn, "show.html", product: product
  end

  defp list_products(params) do
    search_term = get_in(params, ["query"])

    Product
    |> search(search_term)
    |> Repo.all()
  end

  defp search(query, search_term) do
    wildcard_search = "%#{search_term}%"

    from product in query,
    where: ilike(product.product_name, ^wildcard_search),
    or_where: ilike(product.categories, ^wildcard_search),
    or_where: ilike(product.url, ^wildcard_search)
  end


end
