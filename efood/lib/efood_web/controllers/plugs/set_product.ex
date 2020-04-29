defmodule EfoodWeb.Plugs.SetProduct do
  @moduledoc """
  Plug for setting the product_id to the current session.\n
  Used for determining the product in question when conducting further action (adding to cart/removing from cart).
  """

  import Plug.Conn

  @doc """
  N/A
  """
  def init(_params) do
  end

  @doc """
  Retrieves the product_id from conn.params and puts it into the current session.
  """
  def call(conn, _params) do
    %{"id" => product_id} = conn.params

    conn
    |> put_session(:product_id, product_id)
  end
end
