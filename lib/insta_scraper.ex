defmodule InstaScraper do
  @doc ~S"""
  Serializes params

  ## Examples
      iex> InstaScraper.serialize_params(food: "15", bar: "large")
      "?food=15&bar=large"

      iex> InstaScraper.serialize_params([])
      ""
  """
  def serialize_params([]), do: ""
  def serialize_params(params) when is_list(params) do
    "?" <> (params
            |> Enum.map(fn {k, v} -> "#{k}=#{v}" end)
            |> Enum.join("&"))
  end
end
