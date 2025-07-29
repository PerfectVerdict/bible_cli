defmodule BibleLookup.MixProject do
  use Mix.Project
  def project do
  [
    app: :bible_lookup,
    version: "0.1.0",
    elixir: "~> 1.17",
    start_permanent: Mix.env() == :prod,
    deps: deps(),
    releases: [
      bible_lookup: [
        include_erts: true,
        include_executables_for: [:windows, :unix]
      ]
    ]
  ]
end
  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
    {:httpoison, "~> 1.8"},
    {:jason, "~> 1.2"}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
