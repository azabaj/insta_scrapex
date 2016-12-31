defmodule InstaScraper.JSON.Account do
  def url(username) when is_binary(username) do
    "https://www.instagram.com/#{username}/?__a=1"
  end
end
