defmodule PlaytimeWeb.GameController do
  use PlaytimeWeb, :controller

  action_fallback(PlaytimeWeb.FallbackController)

  def get_game(conn, get_params) do
    id = get_params |> Map.get("id")
    user_id = get_params |> Map.get("user_id")
    game_status = Playtime.DB.get_game_status(user_id, id)

    game_details =
      Playtime.get_game(id)
      |> Map.put(:status, game_status)

    conn
    |> put_status(200)
    |> render(:game_details, game_details: game_details)
  end

  def get_games(conn, get_params) do
    page = get_params |> Map.get("page", 1)
    page_size = get_params |> Map.get("page_size", PlaytimeWeb.default_page_size())
    ordering = get_params |> Map.get("ordering", :"-rating")
    genre = get_params |> Map.get("genre")
    platform = get_params |> Map.get("platform")
    rating = get_params |> Map.get("rating")
    store = get_params |> Map.get("store")

    games =
      Playtime.get_games(
        page: page,
        page_size: page_size,
        ordering: ordering,
        genre: genre,
        platform: platform,
        rating: rating,
        store: store
      )

    conn
    |> put_status(200)
    |> render(:get_games, games: games)
  end
end
