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

  def set_game_status(conn, get_params) do
    game_id = get_params |> Map.get("game_id")
    user_id = get_params |> Map.get("user_id")
    status = get_params |> Map.get("status") |> String.to_atom()

    case status do
      :completed ->
        Playtime.DB.set_game_status(user_id, game_id, status)

        conn
        |> put_status(204)
        |> send_resp(204, "")

      :not_played ->
        Playtime.DB.set_game_status(user_id, game_id, status)

        conn
        |> put_status(204)
        |> send_resp(204, "")

      _otherwise ->
        conn
        |> put_view(PlaytimeWeb.ErrorView)
        |> render("400.json", [])
    end
  end
end
