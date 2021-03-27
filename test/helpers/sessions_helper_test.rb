require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users(:admin)
    remember(@user)
  end

  test "is current_user the same as the passed_user?" do
    assert_equal @user, current_user
    assert is_logged_in?
  end

  test "if you remember the digest, nil" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end