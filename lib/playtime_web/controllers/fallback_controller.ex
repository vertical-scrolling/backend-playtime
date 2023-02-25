defmodule PlaytimeWeb.FallbackController do
  use PlaytimeWeb, :controller

  def call(conn, _attrs) do
    conn
    |> put_status(:internal_server_error)
    |> put_view(PlaytimeWeb.ErrorView)
    |> render("500.json", [])
  end
end
