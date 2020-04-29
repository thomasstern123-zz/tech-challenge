defmodule EfoodWeb.AuthController do
  @moduledoc """
  Controller for managing user authentication.
  """

  use EfoodWeb, :controller
  alias Efood.User
  plug Ueberauth

  @doc """
  Receives conn object from OAuth provider and does one of three things:\n
  1. Signs in NEW user\n
  2. Signs in EXISTING user\n
  3. Fails to sign in user and redirects to product index page
  """
  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_params = %{
      token: auth.credentials.token,
      email: auth.info.email,
      provider: to_string(auth.provider)
    }

    changeset = User.changeset(%User{}, user_params)

    _signin(conn, changeset)
  end

  @doc """
  Receives conn object from OAuth provider, signs out the current user, then redirects to product index page.
  """
  def signout(conn, _params) do
    conn
    |> put_flash(:info, "Signed Out")
    # use configure_session(drop: true) for added security -> will not send data to user so put_flash above will also not show
    |> clear_session
    |> redirect(to: Routes.product_path(conn, :index))
  end

  defp _signin(conn, changeset) do
    case _insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome!")
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.product_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error signing in")
        |> redirect(to: Routes.product_path(conn, :index))
    end
  end

  defp _insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)

      user ->
        {:ok, user}
    end
  end
end
