defmodule InstaScraper.JSON.AccountTest do
  use ExUnit.Case

  alias InstaScraper.JSON.Account

  test "it returns url for username" do
    assert "https://www.instagram.com/nasa/?__a=1" == Account.url("nasa")
  end
end
