defmodule InstaScraper.JSONTest do
  use ExUnit.Case

  alias InstaScraper.JSON

  test "it returns url for username" do
    assert "https://www.instagram.com/nasa/?__a=1" == JSON.account_url("nasa")
  end

  test "it returns url for media" do
     assert "https://www.instagram.com/p/BOnA6qtFbTa/?__a=1" == JSON.media_url("BOnA6qtFbTa")
  end

  test "it returns url for account_media" do
     assert "https://www.instagram.com/nasa/media/" == JSON.account_media_url("nasa")

     assert "https://www.instagram.com/nasa/media/?max_id=12341234" == JSON.account_media_url("nasa", max_id: 12341234)
  end
end
