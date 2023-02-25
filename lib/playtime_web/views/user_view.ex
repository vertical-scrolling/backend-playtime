defmodule PlaytimeWeb.UserView do
  use PlaytimeWeb, :view

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      media: user.media,
      playtime: user.playtime
    }
  end
end
