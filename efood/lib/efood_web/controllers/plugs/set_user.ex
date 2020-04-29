defmodule EfoodWeb.Plugs.SetUser do
  @moduledoc """
  Plug for setting the user_id to the current session.\n
  Used for determining the current user when conducting further action (accessing the cart).
  """

  import Plug.Conn
  alias Efood.Repo
  alias Efood.User

  @doc """
  N/A
  """
  def init(_params) do
  end

  @doc """
  Retrieves the user_id from new session and assigns it to conn.user.\n
  Will assign nil if no user found in the session.
  """
  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Repo.get(User, user_id) ->
        assign(conn, :user, user)

      true ->
        assign(conn, :user, nil)
    end
  end
end
