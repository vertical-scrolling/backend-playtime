defmodule Playtime.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Playtime.Repo,
      # Start the Telemetry supervisor
      PlaytimeWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Playtime.PubSub},
      # Start the Endpoint (http/https)
      PlaytimeWeb.Endpoint
      # Start a worker by calling: Playtime.Worker.start_link(arg)
      # {Playtime.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Playtime.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PlaytimeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
