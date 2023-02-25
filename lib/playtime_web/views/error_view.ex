defmodule PlaytimeWeb.ErrorView do
  use PlaytimeWeb, :view

  def render("500.json", _assigns) do
    %{status: 500, title: "Internal Server Error", detail: "Internal server error"}
  end

  def template_not_found(_template, assigns) do
    render(500, assigns)
  end
end
