defmodule Playtime do
  def get_game(id) do
    with {:ok, game} <- RawgEx.get_game(:playtime_rawg, id) do
      game
    end
  end

  def get_games(opts) do
    with {:ok, %{results: games}} <- RawgEx.get_games(:playtime_rawg, opts) do
      games
    end
  end

  def get_genres(opts) do
    with {:ok, %{results: genres}} <- RawgEx.get_genres(:playtime_rawg, opts) do
      genres
    end
  end

  def get_platforms(opts) do
    with {:ok, %{results: platforms}} <- RawgEx.get_platforms(:playtime_rawg, opts) do
      platforms
    end
  end

  def get_stores(opts) do
    with {:ok, %{results: stores}} <- RawgEx.get_stores(:playtime_rawg, opts) do
      stores
    end
  end
end
