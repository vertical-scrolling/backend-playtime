defmodule PlaytimeWeb.PlatformView do
  use PlaytimeWeb, :view

  def render("platform.json", %{platform: platform}) do
    %{
      id: platform.id |> Integer.to_string(),
      name: platform.name
    }
  end

  def render("get_platforms.json", %{platforms: platforms}) do
    %{
      platforms: render_many(platforms, __MODULE__, "platform.json", as: :platform)
    }
  end
end
