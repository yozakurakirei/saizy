require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    @user = users(:saizy)
  end

  test "should get signup" do
    get signup_path
    assert_response :success
  end

  test "You cannot see the index page if you have not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "Unlogged in cannot be edited" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "Unlogged in cannot be updated" do
    patch user_path(@user), 
      params: { user: {
      name: @user.name,
      email: @user.email }}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "Do not allow admin attribute" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user), params: {
      user: {
        password: "password",
        password_confirmation: "password",
        admin: FILL_IN } }
    assert_not @other_user.FILL_IN.admin?
  end
end
