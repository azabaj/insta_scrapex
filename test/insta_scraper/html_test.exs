defmodule InstaScraper.HTMLTest do
  use ExUnit.Case

  alias InstaScraper.HTML

  test "it returns url for username" do
    assert "https://www.instagram.com/nasa/" == HTML.account_url("nasa")
  end
end
