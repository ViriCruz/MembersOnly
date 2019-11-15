require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get posts_new_url
    assert_response :success
  end

  test "should get create" do
    get posts_create_url
    assert_response :success
  end

  test "should get index" do
    get posts_index_url
    assert_response :success
  end

  test "user can't see author post when not logged in" do
  end

  test "user can see author post when logged in" do
  end

  test "user can't access create post [get posts/new] when logged in" do
  end

  test "user can't access create post [post posts/create] when not logged in" do
  end

  test "user can create post when logged in" do
  end

  test "user can't create empty posts" do
  end

  test "user can't create titleless posts" do
  end

end
