require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:ivan)
    @post = Post.new(title: "LoremImpsum",body: "LoremImpsumLoremImpsumLoremImpsumLoremImpsumLoremImpsumLoremImpsumLoremImpsum",user_id: @user.id)
  end

  test "Post should be valid" do
    assert @post.valid?
  end

  test "user can't create empty posts" do
    @post.body = nil
    assert_not @post.valid?
    @post.body = ""
    assert_not @post.valid?
  end

  test "user can't create titleless posts" do
    @post.title = nil
    assert_not @post.valid?
    @post.title = ""
    assert_not @post.valid?
  end

  test "title can't be longer than 20 chars" do
    @post.title = "a"*21
    assert_not @post.valid?
  end

  test "title can't be shorter than 6 chars" do
    @post.title = "a"*5
    assert_not @post.valid?
  end

  test "body can't be longer than 300 chars" do
    @post.body = "a"*301
    assert_not @post.valid?
  end

  test "body can't be shorter than x chars" do
    @post.body = "a"*14
    assert_not @post.valid?
  end
end
