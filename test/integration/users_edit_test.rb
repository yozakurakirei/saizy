require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  # def setup
  #   @user = users(:admin)
  # end

  # test "unsuccessful edit" do
  #   log_in_as(@user)
  #   get edit_user_path(@user)
  #   assert_template 'users/edit'
  #   patch user_path(@user), 
  #   params: { user: { 
  #     name:  "",
  #     email: "admin@example" } }

  #   assert_template 'users/edit'
  # end


  # test "successful edit" do 
  #   get edit_user_path(@user)
  #   log_in_as(@user)
  #   assert_redirected_to edit_user_url(@user)
  #   name = "admin admin"
  #   email = "admin@example.com"
  #   patch user_path(@user), params: {
  #     user: {
  #       name: name,
  #       email: email } }
  #   assert_not flash.empty?
  #   assert_redirected_to @user
  #   @user.reload
  #   assert_equal name, @user.name
  #   assert_equal email, @user.email
  # end
end
