defmodule PlaytimeWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :playtime

  @session_options [
    store: :cookie,
    key: "_playtime_key",
    signing_salt: "pB8eLNs5"
  ]

  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.Static,
    at: "/",
    from: :playtime,
    gzip: false,
    only: ~w(assets fonts images favicon.ico robots.txt)

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug PlaytimeWeb.Router
end
