defmodule InstaScrapex.JSON do
  @moduledoc """
    This module's functions parse the JSON endpoints of Instagram
    and return it as a map.
  """

  use HTTPoison.Base

  @doc """
    Use this to get info about accounts

    Wraps HTTPoison.get!, but takes a username instead of url,
    and returns a Map in the response[:body]

    ## Examples

        iex> InstaScrapex.JSON.get_account!("nasa")
        %HTTPoison.Response{body: %{}, ...}

  """
  def get_account!(username, headers \\ [], options \\ []) do
    username
    |> account_url
    |> get!(headers, options)
  end

  @doc false
  def account_url(username) when is_binary(username) do
    "https://www.instagram.com/#{username}/?__a=1"
  end

  @doc """
    Use this to get info about posts

    Wraps HTTPoison.get!, but takes a media_code instead of url,
    and returns a Map in the response[:body]

    ## Examples

        iex> InstaScrapex.JSON.get_media!("BKgPf5ZgP97")
        %HTTPoison.Response{body: %{}, ...}

  """
  def get_media!(media_code, headers \\ [], options \\ []) do
    media_code
    |> media_url
    |> get!(headers, options)
  end

  @doc false
  def media_url(media_code) when is_binary(media_code) do
    "https://www.instagram.com/p/#{media_code}/?__a=1"
  end

  @doc """
    Use this to get a list of posts from a user
    use :max_id in params to paginate and get older posts

    Wraps HTTPoison.get!, but takes a username instead of url,
    and returns a Map in the response[:body]

    ## Examples

        iex> InstaScrapex.JSON.get_account_media!("nasa")
        %HTTPoison.Response{body: %{}, ...}

        iex> InstaScrapex.JSON.get_account_media!("nasa", [], [params: [max_id: "12341234"]])
        %HTTPoison.Response{body: %{}, ...}

  """
  def get_account_media!(username, headers \\ [], options \\ []) do
    username
    |> account_media_url
    |> get!(headers, options)
  end

  @doc false
  def account_media_url(username) when is_binary(username) do
   "https://www.instagram.com/#{username}/media/"
  end

  @doc false
  def process_response_body(body) do
    body |> Poison.decode!
  end
end
