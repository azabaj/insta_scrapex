defmodule InstaScrapex.HTMLTest do
  use ExUnit.Case

  alias InstaScrapex.HTML

  test "it returns url for username" do
    assert "https://www.instagram.com/nasa/" == HTML.account_url("nasa")
  end

  test "it returns url for media" do
     assert "https://www.instagram.com/p/12341234/" == HTML.media_url("12341234")
  end

  test "it decodes json embedded in html" do
    body = File.read!("./test/insta_scraper/test_responses/account.html")

    assert HTML.process_response_body(body)
  end

  test "it raises if json decode fails" do
    body = "<html></html>"

    assert_raise Poison.SyntaxError, fn -> HTML.process_response_body(body)
    end
  end
end
