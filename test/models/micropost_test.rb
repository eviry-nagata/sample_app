require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    # このコードは慣習的に正しくない
    # これは、user_idが存在していることを確認するためのコード
    @micropost = @user.microposts.build(content: "Lorem ipsum")
  end

  # ここで、@micropostが有効であることを確認している
  test "should be valid" do
    assert @micropost.valid?
  end

  # ここで、@micropostのuser_idが存在していることを確認している
  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  # ここで、@micropostのcontentが存在していることを確認している
  test "content should be present" do
    @micropost.content = "   "
    assert_not @micropost.valid?
  end

  # ここで、@micropostのcontentが140文字以下であることを確認している
  test "content should be at most 140 characters" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end

    # このテストは、最新のマイクロポストが最初に表示されることを確認している
  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
end
