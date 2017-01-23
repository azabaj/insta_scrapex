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

  @doc """
    Use this to get a list of a post's comments
    use :last_comment_id in post_data to paginate and get older posts

    Wraps HTTPoison.post!, but takes a %{code: "BKgPf5ZgP97"} instead of url,
    and returns a Map in the response[:body]

    ## Examples

        iex> InstaScrapex.JSON.get_media_comments!(%{code: "BKgPf5ZgP97"})
        %HTTPoison.Response{body: %{}, ...}

        iex> InstaScrapex.JSON.get_media_comments!(%{code: "BKgPf5ZgP97", last_comment_id: 12341234, per_page: 20})
        %HTTPoison.Response{body: %{}, ...}

  """
  def get_media_comments!(post_data = %{code: code}, headers \\ [], options \\[]) do
    last_comment_id = post_data[:last_comment_id] || (get_media!(code).body["media"]["comments"]["nodes"] |> List.last)["id"]
    per_page = post_data[:per_page] || 20

    body = "q=ig_shortcode(#{code}){comments.before(#{last_comment_id},#{per_page}){count,nodes{id,created_at,text,user{id,profile_pic_url,username,follows{count},followed_by{count},biography,full_name,media{count},is_private,external_url,is_verified}},page_info}}"

    query_url
    |> post!(body, headers ++ fake_headers, options)
  end

  @doc false
  def account_media_url(username) when is_binary(username) do
   "https://www.instagram.com/#{username}/media/"
  end

  @doc false
  def process_response_body(body) do
    body |> Poison.decode!
  end

  @doc false
  def query_url, do: "https://www.instagram.com/query/"

  @doc false
  def fake_headers do
    random = random_string

    [
      "content-type": "application/x-www-form-urlencoded",
      "X-CSRFToken": random,
      "Cookie":  "csrftoken=#{random};",
      "Referer": "https://www.instagram.com/",
      "x-instagram-ajax": "1",
      "x-requested-with": "XMLHttpRequest",
    ]
  end

  def random_string(length \\ 10) do
    :crypto.strong_rand_bytes(length) |> Base.url_encode64 |> binary_part(0, length) |> String.replace(~r/[_-]/, "a")
  end
end
