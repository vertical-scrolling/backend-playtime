defmodule PlaytimeWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      import Plug.Conn
      import Phoenix.ConnTest
      import PlaytimeWeb.ConnCase

      alias PlaytimeWeb.Router.Helpers, as: Routes

      @endpoint PlaytimeWeb.Endpoint
    end
  end

  setup _tags do
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
