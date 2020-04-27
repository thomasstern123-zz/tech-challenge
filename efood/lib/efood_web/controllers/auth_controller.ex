defmodule EfoodWeb.AuthController do
  use EfoodWeb, :controller
  plug Ueberauth

  alias Efood.User

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user_params = %{token: auth.credentials.token, email: auth.info.email, provider: to_string(auth.provider)}
    changeset = User.changeset(%User{}, user_params)

    signin(conn, changeset)
  end

  def signout(conn, _params) do
  conn
  |> put_flash(:info, "Signed Out")
  |> clear_session #use configure_session(drop: true) for added security -> will not send data to user so put_flash above will also not show
  |> redirect(to: Routes.product_path(conn, :index))
  end

  defp signin(conn, changeset) do
    case insert_or_update_user(changeset) do
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

  defp insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)
      user ->
        {:ok, user}
    end
  end
end
