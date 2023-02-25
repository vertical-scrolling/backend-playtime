defmodule PlaytimeWeb.GameView do
  use PlaytimeWeb, :view

  def render("game.json", %{game: game}) do
    %{
      id: game.id |> Integer.to_string(),
      name: game.name,
      released: game.released,
      rating: game.rating,
      media: %{
        url: game.background_image
      }
    }
  end

  def render("game_details.json", %{game_details: game_details}) do
    %{
      id: game_details.id |> Integer.to_string(),
      name: game_details.name,
      released: game_details.released,
      rating: game_details.rating,
      media: %{
        url: game_details.background_image
      },
      description: game_details.description |> HtmlEntities.decode(),
      playtime: game_details.playtime,
      status: game_details.status
    }
  end

  def render("get_games.json", %{games: games}) do
    %{
      games: render_many(games, __MODULE__, "game.json", as: :game)
    }
  end
end
