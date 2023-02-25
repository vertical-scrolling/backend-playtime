defmodule PlaytimeWeb.ErrorView do
  use PlaytimeWeb, :view

  def render("404.json", _assigns) do
    %{status: 404, title: "Not Found", detail: "The server cannot find the requested resource"}
  end

  def render("500.json", _assigns) do
    %{status: 500, title: "Internal Server Error", detail: "Internal server error"}
  end

  def template_not_found(_template, assigns) do
    render(500, assigns)
  end
end
