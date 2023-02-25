defmodule PlaytimeWeb.GenreView do
  use PlaytimeWeb, :view

  def render("genre.json", %{genre: genre}) do
    %{
      id: genre.id,
      name: genre.name
    }
  end

  def render("get_genres.json", %{genres: genres}) do
    %{
      genres: render_many(genres, __MODULE__, "genre.json", as: :genre)
    }
  end
end
