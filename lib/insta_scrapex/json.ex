defmodule InstaScrapex.JSON do
  use HTTPoison.Base

  def get_account(username, headers \\ [], options \\ []) do
    username
    |> account_url
    |> get(headers, options)
  end

  def account_url(username) when is_binary(username) do
    "https://www.instagram.com/#{username}/?__a=1"
  end

  def get_media(media_code, headers \\ [], options \\ []) do
    media_code
    |> media_url
    |> get(headers, options)
  end

  def media_url(media_code) when is_binary(media_code) do
    "https://www.instagram.com/p/#{media_code}/?__a=1"
  end

  def get_account_media(username, headers \\ [], options \\ []) do
    username
    |> account_media_url
    |> get(headers, options)
  end

  def account_media_url(username) when is_binary(username) do
   "https://www.instagram.com/#{username}/media/"
  end

  def process_response_body(body) do
    body |> Poison.decode!
  end
end
