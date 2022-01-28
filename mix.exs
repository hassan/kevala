defmodule Kevala.MixProject do
  use Mix.Project

  def project do
    [
      app: :kevala,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :nimble_csv],
      mod: {Kevala.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nimble_csv, "~> 1.2"},
      {:faker, "~> 0.17.0", only: [:test]},
      {:credo, "~> 1.6"},
      {:dialyxir, "~> 1.1", runtime: false}
    ]
  end
end
