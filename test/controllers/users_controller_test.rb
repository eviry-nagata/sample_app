require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    # 他のユーザーを定義
    @other_user = users(:archer)
  end


# このテストは、ログインしていないユーザーがユーザー情報を編集しようとしたときに、ログインページにリダイレクトするかどうかをテストしています。
  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

#このテストは
  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

# このテストは、ログインしていないユーザーがユーザーを削除しようとしたときに、ログインページにリダイレクトするかどうかをテストしています。
# この成功は、ユーザーが削除されないことを意味します。
  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count'  do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end

  # このテストは、ログインしているユーザーが他のユーザーの編集ページにアクセスしようとしたときに、ルートURLにリダイレクトするかどうかをテストしています。
  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end
  # このテストは、ログインしていないユーザーがフォローしているユーザーを取得しようとしたときに、ログインページにリダイレクトするかどうかをテストしています。 
  test "should redirect following when not logged in" do
    get following_user_path(@user)
    assert_redirected_to login_url
  end
  # このテストは、ログインしていないユーザーがフォロワーを取得しようとしたときに、ログインページにリダイレクトするかどうかをテストしています。
  test "should redirect followers when not logged in" do
    get followers_user_path(@user)
    assert_redirected_to login_url
  end
end
