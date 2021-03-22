require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "Registration test for invalid users" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                         email: "user@invalid",
                                         password: "password",
                                         password_confirmation: "passcode" } }
    end
    assert_template "users/signup"
  end
end
