defmodule Playtime.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :playtime,
      version: @version,
      elixir: "~> 1.14.3",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Playtime.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:html_entities, "~> 0.5.2"},
      {:jason, "~> 1.2"},
      {:mongodb_driver, "~> 1.0.0"},
      {:phoenix, "~> 1.6.16"},
      {:plug_cowboy, "~> 2.5"},
      {:rawg_ex, git: "https://github.com/vertical-scrolling/rawg_ex.git", branch: "main"}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get"],
      test: ["test"]
    ]
  end
end
