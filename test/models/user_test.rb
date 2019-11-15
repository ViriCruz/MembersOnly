require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:ivan)
    @post = Post.new(user_id: @user.id)
  end

  test "Post should be valid" do
    assert @post.valid?
  end

end
