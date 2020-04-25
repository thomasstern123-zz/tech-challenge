defmodule EfoodWeb.ProductController do
  use EfoodWeb, :controller
  alias Efood.Product

  def index(conn, _params) do
    products = Repo.all(Product)
    render conn, "index.html", products: products
  end

  def show(conn, %{"id" => product_id}) do
    product = Repo.get!(Product, product_id)
    render conn, "show.html", product: product
  end

end
