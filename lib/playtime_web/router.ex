defmodule PlaytimeWeb.Router do
  use PlaytimeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PlaytimeWeb do
    pipe_through :api
  end
end
