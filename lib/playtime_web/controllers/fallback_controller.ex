defmodule PlaytimeWeb.FallbackController do
  use PlaytimeWeb, :controller

  def call(conn, :not_found) do
    conn
    |> put_status(404)
    |> put_view(PlaytimeWeb.ErrorView)
    |> render("404.json", [])
  end

  def call(conn, :internal_server_error) do
    conn
    |> put_status(500)
    |> put_view(PlaytimeWeb.ErrorView)
    |> render("500.json", [])
  end
end
