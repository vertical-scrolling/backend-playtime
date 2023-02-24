defmodule Playtime.Repo do
  use Ecto.Repo,
    otp_app: :playtime,
    adapter: Ecto.Adapters.Postgres
end
