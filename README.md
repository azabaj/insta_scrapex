# InstaScrapex

Scrapes Instagram JSON and HTML endpoints without and API key

Use at your own risk

## Installation

  1. Add `insta_scrapex` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:insta_scrapex, "~> 0.1.0"}]
    end
    ```

  2. Ensure `insta_scrapex` is started before your application:

    ```elixir
    def application do
      [applications: [:insta_scrapex]]
    end
    ```

## Usage
  All functions return a map in the `response[:body]`
  Functions wrap [HTTPoison.get/1](https://hexdocs.pm/httpoison/HTTPoison.html#get/3) so you can pass headers and other options to them

### JSON endpoints

  `InstaScrapex.JSON.get_account("nasa")`
  `{:ok, %HTTPoison.Response{body: %{}, ...}}`

  `InstaScrapex.JSON.get_media("BKgPf5ZgP97")`
  `{:ok, %HTTPoison.Response{body: %{}, ...}}`

  `InstaScrapex.JSON.get_account_media("nasa")`
  `{:ok, %HTTPoison.Response{body: %{}, ...}}`

### HTML endpoints

  `InstaScrapex.HTML.get_account("nasa")`
  `{:ok, %HTTPoison.Response{body: %{}, ...}}`

  `InstaScrapex.HTML.get_media("BKgPf5ZgP97")`
  `{:ok, %HTTPoison.Response{body: %{}, ...}}`

## LICENSE
	InstaScrapex is released into the public domain. See [UNLICENSE](http://unlicense.org/) for more information or the accompanying UNLICENSE file.
