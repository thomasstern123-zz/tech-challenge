defmodule  EfoodWeb.Plugs.SetProduct do
  import Plug.Conn
  import Phoenix.Controller

  alias Efood.Repo
  alias Efood.Product

  def init(_params) do
  end

  def call(conn, params) do
    %{"id" => product_id} = conn.params
    conn
    |> put_session(:product_id, product_id)
  end
end
