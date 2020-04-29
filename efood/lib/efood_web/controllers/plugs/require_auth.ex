defmodule EfoodWeb.Plugs.RequireAuth do
  @moduledoc """
  Plug for requiring user authentication to be used before specific actions.
  """

  import Plug.Conn
  import Phoenix.Controller
  alias EfoodWeb.Router.Helpers, as: Routes

  @doc """
  N/A
  """
  def init(_params) do
  end

  @doc """
  Checks that a user is assigned in the conn object.\n
  Will halt the action if not and redirect to the product index.\n
  Will allow the user to proceed and return the conn object otherwise.
  """
  def call(conn, _params) do
    if conn.assigns[:user] do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in.")
      |> redirect(to: Routes.product_path(conn, :index))
      |> halt()
    end
  end
end
