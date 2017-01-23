# InstaScrapex

Scrapes Instagram JSON and HTML endpoints without and API key

Use at your own risk

## Installation

  1. Add `insta_scrapex` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:insta_scrapex, "~> 0.3.0"}]
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
  Functions wrap [HTTPoison.get!/3](https://hexdocs.pm/httpoison/HTTPoison.html#get/3) so you can pass headers and other options to them

### JSON endpoints

  ```elixir
  iex> InstaScrapex.JSON.get_account!("nasa")
  %HTTPoison.Response{body: %{}, ...}
  ````

  ```elixir
  iex> InstaScrapex.JSON.get_media!("BKgPf5ZgP97")
  %HTTPoison.Response{body: %{}, ...}
  ````

  ```elixir
  iex> InstaScrapex.JSON.get_account_media!("nasa")
  %HTTPoison.Response{body: %{}, ...}
  # paginate:
  iex> InstaScrapex.JSON.get_account_media!("nasa", [], [params: [max_id: 12341234]])
  %HTTPoison.Response{body: %{}, ...}
  ````

  ```elixir
  iex> InstaScrapex.JSON.get_media_comments!(%{code: "BKgPf5ZgP97"})
  %HTTPoison.Response{body: %{}, ...}
  # paginate:
  iex> InstaScrapex.JSON.get_media_comments!(%{"BKgPf5ZgP97", last_comment_id: 12341234})
  %HTTPoison.Response{body: %{}, ...}
  ````

### HTML endpoints

  ```elixir
  iex> InstaScrapex.HTML.get_account!("nasa")
  %HTTPoison.Response{body: %{}, ...}
  ````

  ```elixir
  iex> InstaScrapex.HTML.get_media!("BKgPf5ZgP97")
  %HTTPoison.Response{body: %{}, ...}
  ````

## LICENSE
	InstaScrapex is released into the public domain. See [UNLICENSE](http://unlicense.org/) for more information or the accompanying UNLICENSE file.
