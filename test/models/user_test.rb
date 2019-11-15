require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:ivan)
    @post = Post.new(title: "d",body: "a",user_id: @user.id)
  end

  test "Post should be valid" do
    assert @post.valid?
  end

  test "user can't create empty posts" do
    @post.body = nil
    assert_not @post.valid?
  end

  test "user can't create titleless posts" do
    @post.title = nil
    assert_not @post.valid?
  end
end
