require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @micropost = microposts(:orange)
  end

  # このテストは、ログインしていないユーザーがマイクロポストを作成しようとしたときに、 create アクションがリダイレクトすることを確認している
  test "should redirect create when not logged in" do
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  # このテストは、ログインしていないユーザーがマイクロポストを削除しようとしたときに、 destroy アクションがリダイレクトすることを確認している
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Micropost.count' do
      delete micropost_path(@micropost)
    end
    assert_redirected_to login_url
  end
# このテストは、正しいユーザーでない場合にマイクロポストを削除しようとしたときに、 destroy アクションがリダイレクトすることを確認している
# リダイレクトとは、アクセスしたページを別のページに転送すること
  test "should redirect destroy for wrong micropost" do
    log_in_as(users(:michael))
    micropost = microposts(:ants)
    assert_no_difference 'Micropost.count' do
      delete micropost_path(micropost)
    end
    assert_redirected_to root_url
  end
end
