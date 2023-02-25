defmodule Playtime do
  def get_games(opts) do
    with {:ok, %{results: games}} <- RawgEx.get_games(:playtime, opts) do
      games
    end
  end
end
