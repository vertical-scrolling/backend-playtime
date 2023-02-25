defmodule PlaytimeWeb.Router do
  use PlaytimeWeb, :router

  pipeline :static do
    plug Plug.Static,
      at: "/",
      from: {:playtime, "priv/static"}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/1", PlaytimeWeb do
    pipe_through :api

    get("/games", GameController, :get_games)
    get("/games/:id", GameController, :get_game)
    get("/genres", GenreController, :get_genres)
    get("/platforms", PlatformController, :get_platforms)
    get("/stores", StoreController, :get_stores)
    get("/users/:id", UserController, :get_user)
    put("/users/:user_id/games/:game_id/status", UserController, :set_game_status)
  end

  scope "/", PlaytimeWeb do
    pipe_through :static
    get("/*not_found", FallbackController, :not_found)
    post("/*not_found", FallbackController, :not_found)
    put("/*not_found", FallbackController, :not_found)
    delete("/*not_found", FallbackController, :not_found)
    head("/*not_found", FallbackController, :not_found)
    patch("/*not_found", FallbackController, :not_found)
  end
end
