require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get login" do
    get login_path
    assert_template 'sessions/new'
  end

  # test "should post login" do
  #   post login_path
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   delete destroy_url
  #   assert_response :success
  # end

end
