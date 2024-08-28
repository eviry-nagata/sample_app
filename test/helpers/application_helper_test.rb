require 'test_helper'

class ApplicationTest < ActionView::TestCase
# タイトルが正しく表示されることを確認する
# full_titleヘルパーの引数に渡す値は、空文字列と"Help"の2つをテストします。
  test "full title helper" do
    assert_equal full_title, "Ruby on Rails Tutorial Sample App"
    assert_equal full_title("Help"), "Help | Ruby on Rails Tutorial Sample App"
  end
end