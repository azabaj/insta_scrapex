defmodule InstaScrapex.HTMLTest do
  use ExUnit.Case

  alias InstaScrapex.HTML

  test "it returns url for username" do
    assert "https://www.instagram.com/nasa/" == HTML.account_url("nasa")
  end

  test "it returns url for media" do
     assert "https://www.instagram.com/p/12341234/" == HTML.media_url("12341234")
  end
end
