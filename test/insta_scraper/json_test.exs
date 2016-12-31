defmodule InstaScraper.JSONTest do
  use ExUnit.Case

  alias InstaScraper.JSON

  test "it returns url for username" do
    assert "https://www.instagram.com/nasa/?__a=1" == JSON.account_url("nasa")
  end

  test "it returns url for media" do
     assert "https://www.instagram.com/p/BOnA6qtFbTa/?__a=1" == JSON.media_url("BOnA6qtFbTa")
  end
end
