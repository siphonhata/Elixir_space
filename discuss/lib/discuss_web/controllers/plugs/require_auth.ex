defmodule Discuss.Plugs.RequireAuth do

  use DiscussWeb, :controller
  import Plug.Conn

  def init() do

  end

  def call(conn, _params) do
    if conn.assigns[:user] do
      conn
    else
      conn
       |> put_flash(:error, "You must be logged in.")
       |> redirect(to: ~p"/topics")
       |> halt()
    end
  end
end
