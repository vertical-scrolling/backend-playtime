defmodule PlaytimeWeb.Router do
  use PlaytimeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/1", PlaytimeWeb do
    pipe_through :api

    get("/games", GameController, :get_games)
    get("/genres", GenreController, :get_genres)
    get("/platforms", PlatformController, :get_platforms)
  end
end
