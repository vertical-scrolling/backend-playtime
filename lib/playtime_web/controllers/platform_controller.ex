defmodule PlaytimeWeb.PlatformController do
  use PlaytimeWeb, :controller

  action_fallback(PlaytimeWeb.FallbackController)

  def get_platforms(conn, get_params) do
    page = get_params |> Map.get("page", 1)
    page_size = get_params |> Map.get("page_size", PlaytimeWeb.default_page_size())
    ordering = get_params |> Map.get("ordering", :games_count)

    platforms =
      Playtime.get_platforms(
        page: page,
        page_size: page_size,
        ordering: ordering
      )

    conn
    |> put_status(200)
    |> render(:get_platforms, platforms: platforms)
  end
end
