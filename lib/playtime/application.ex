defmodule Playtime.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PlaytimeWeb.Endpoint,
      {RawgEx,
       name: :playtime,
       api_key: Application.get_env(:playtime, Playtime) |> Keyword.get(:rawg_api_key)}
    ]

    opts = [strategy: :one_for_one, name: Playtime.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    PlaytimeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
