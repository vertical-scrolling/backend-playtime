defmodule PlaytimeWeb.UserController do
  use PlaytimeWeb, :controller

  action_fallback(PlaytimeWeb.FallbackController)

  def get_user(conn, get_params) do
    id = get_params |> Map.get("id")
    user = Playtime.DB.get_user(id)

    conn
    |> put_status(200)
    |> render(:user, user: user)
  end
end
