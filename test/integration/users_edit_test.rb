require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
  end

  test "unsuccessful edit" do 
    get edit_user_path(@user)
    assert_template "users/edit"
    name = "admin admin"
    email = "admin@example.com"
    patch user_path(@user), params: {
      user: {
        name: name,
        email: email } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
