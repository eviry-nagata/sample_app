require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users(:michael)
    remember(@user)
  end
# このテストは、remember_digestがnilの場合にcurrent_userが正しいユーザーを返すことを確認する
  test "current_user returns right user when session is nil" do
    assert_equal @user, current_user
    assert is_logged_in?
  end
# このテストは、remember digestが間違っている場合にcurrent_userがnilを返すことを確認する
  test "current_user returns nil when remember digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end
