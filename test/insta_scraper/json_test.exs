defmodule InstaScrapex.JSONTest do
  use ExUnit.Case

  alias InstaScrapex.JSON

  test "it returns url for username" do
    assert "https://www.instagram.com/nasa/?__a=1" == JSON.account_url("nasa")
  end

  test "it returns url for media" do
     assert "https://www.instagram.com/p/BOnA6qtFbTa/?__a=1" == JSON.media_url("BOnA6qtFbTa")
  end

  test "it returns url for account_media" do
     assert "https://www.instagram.com/nasa/media/" == JSON.account_media_url("nasa")
  end

  test "it decodes json" do
    body = File.read!("./test/insta_scraper/test_responses/account.json")

    assert JSON.process_response_body(body)
  end

  test "it raises if json decode fails" do
    body = "{]"

    assert_raise Poison.SyntaxError, fn -> JSON.process_response_body(body)
    end
  end
end
