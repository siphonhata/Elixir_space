defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth

  alias Discuss.Accounts.User
  alias Discuss.Repo

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_params = %{token: auth.credentials.token, email: auth.info.email, provider: "github"}
    changeset = User.changeset(%User{}, user_params)

    signin(conn, changeset)
  end

  def signout(conn, _params) do
    conn
     |> configure_session(drop: true)
     |> redirect(to: ~p"/topics")
  end

  defp signin(conn, changeset) do
    case inset_or_update_user(changeset) do
      {:ok, user} ->
        conn
          |> put_flash(:info, "Welcome back!")
          |> put_session(:user_id, user.id)
          |> redirect(to: ~p"/topics")
      {:error, _reason} ->
        conn
          |> put_flash(:error, "Error sigining in")
          |> redirect(to: ~p"/topics")
    end
  end

  defp inset_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)
      user ->
        {:ok, user}
    end
  end
end
