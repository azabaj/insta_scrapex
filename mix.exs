defmodule InstaScrapex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :insta_scrapex,
      version: "0.1.0",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),

      name: "InstaScrapex",
      description: "Scrapes Instagram JSON and HTML endpoints without and API key",
      package: [
        maintainers: ["Barna Kovacs"],
        licenses: ["UNLICENSE"],
        links: %{"GitHub" => "https://github.com/preciz/insta_scrapex"},
      ],
      source_url: "https://github.com/preciz/insta_scrapex",
      homepage_url: "https://github.com/preciz/insta_scrapex",
      docs: [
        main: "InstaScrapex.JSON",
        extras: ["README.md"],
        links: %{
          github: "https://github.com/preciz/insta_scrapex",
        },
      ],
   ]
  end

  def application do
    [
      applications: [:logger, :httpoison]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev},

      {:httpoison, "~> 0.10.0"},
      {:poison, "~> 3.0"},
    ]
  end
end
