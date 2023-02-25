defmodule Playtime.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    rawg_api_key =
      Application.get_env(:playtime, Playtime)
      |> Keyword.get(:rawg_api_key)

    mongo_host =
      Application.get_env(:playtime, Playtime.DB)
      |> Keyword.get(:host)

    mongo_username =
      Application.get_env(:playtime, Playtime.DB)
      |> Keyword.get(:username)

    mongo_password =
      Application.get_env(:playtime, Playtime.DB)
      |> Keyword.get(:password)

    children = [
      PlaytimeWeb.Endpoint,
      {RawgEx, name: :playtime_rawg, api_key: rawg_api_key},
      {Mongo,
       name: :playtime_mongo,
       url: "mongodb+srv://#{mongo_username}:#{mongo_password}@#{mongo_host}/playtime"}
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
