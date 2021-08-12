defmodule SitioTechClassroom do
  use Mix.Project

  def project do
    [
      app: :sitio_tech_classroom,
      version: "0.0.1",
      elixir: "~> 1.12",
      elixirc_paths: ["lib"],
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {SitioTechClassroom.Application, []},
      extra_applications: [:logger, :runtime_tools, :inets, :ssl]
    ]
  end

  defp aliases do
    []
  end

  defp deps do
    [
      {:flow, "~> 1.1.0"},
      {:kino, "~> 0.3.0"},
      {:nimble_csv, "~> 1.1.0"},
      {:vega_lite, "~> 0.1.0"}
    ]
  end
end
