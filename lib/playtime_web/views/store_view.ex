defmodule PlaytimeWeb.StoreView do
  use PlaytimeWeb, :view

  def render("store.json", %{store: store}) do
    %{
      id: store.id,
      name: store.name
    }
  end

  def render("get_stores.json", %{stores: stores}) do
    %{
      stores: render_many(stores, __MODULE__, "store.json", as: :store)
    }
  end
end
