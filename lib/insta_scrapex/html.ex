defmodule InstaScrapex.HTML do
  @moduledoc """
    This module's functions parse the embedded sharedData JSON object from
    HTML responses and return it as a map.
  """
  use HTTPoison.Base

  @doc """
    Use this to get info about accounts

    Wraps HTTPoison.get, but takes a username instead of url,
    and returns a Map in the response[:body]

    ## Examples

        iex> get_account("nasa")
        {:ok, %HTTPoison.Response{body: %{}, ...}

  """
  def get_account(username, headers \\ [], options \\ []) do
    username
    |> account_url
    |> get(headers, options)
  end

  @doc false
  def account_url(username) when is_binary(username) do
    "https://www.instagram.com/#{username}/"
  end

  @doc """
    Use this to get info about posts

    Wraps HTTPoison.get, but takes a media_code instead of url,
    and returns a Map in the response[:body]

    ## Examples

        iex> get_media("BKgPf5ZgP97")
        {:ok, %HTTPoison.Response{body: %{}, ...}

  """
  def get_media(media_code, headers \\ [], options \\ []) do
    media_code
    |> media_url
    |> get(headers, options)
  end

  @doc false
  def media_url(media_code) when is_binary(media_code) do
    "https://www.instagram.com/p/#{media_code}/"
  end

  @doc false
  def process_response_body(body) do
    Regex.named_captures(~r/_sharedData = (?<json>{.+});</, body)["json"]
    |> Poison.decode!
  end
end
