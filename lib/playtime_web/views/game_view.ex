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

  def render("get_games.json", %{games: games}) do
    %{
      games: render_many(games, __MODULE__, "game.json", as: :game)
    }
  end
end
