defmodule InstaScraper.HTML do
  #import InstaScraper, only: [serialize_params: 1]

  def get_account(username) do
    username
    |> account_url
    |> get
  end

  def account_url(username) when is_binary(username) do
    "https://www.instagram.com/#{username}/"
  end

  defp get(url) do
    url
    |> HTTPoison.get
    |> handle_response
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    Regex.named_captures(~r/_sharedData = (?<json>{.+});</, body)["json"]
    |> Poison.decode
  end

  defp handle_response({_, resp = %HTTPoison.Response{}}) do
    {:error, resp}
  end
end
