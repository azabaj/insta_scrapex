defmodule InstaScraper.JSON do
  def get_account(username) do
    username
    |> account_url
    |> get
  end

  def account_url(username) when is_binary(username) do
    "https://www.instagram.com/#{username}/?__a=1"
  end

  def get_media(media_code) do
    media_code
    |> media_url
    |> get
  end

  def media_url(media_code) when is_binary(media_code) do
    "https://www.instagram.com/p/#{media_code}/?__a=1"
  end

  defp get(url) do
    url
    |> HTTPoison.get
    |> handle_response
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    body |> Poison.decode
  end

  defp handle_response({_, resp = %HTTPoison.Response{}}) do
    {:error, resp}
  end
end
