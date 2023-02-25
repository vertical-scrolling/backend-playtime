defmodule Playtime do
  def get_games(opts) do
    with {:ok, %{results: games}} <- RawgEx.get_games(:playtime, opts) do
      games
    end
  end

  def get_genres(opts) do
    with {:ok, %{results: genres}} <- RawgEx.get_genres(:playtime, opts) do
      genres
    end
  end

  def get_platforms(opts) do
    with {:ok, %{results: platforms}} <- RawgEx.get_platforms(:playtime, opts) do
      platforms
    end
  end
end
