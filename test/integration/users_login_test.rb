require 'test_helper'
class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin)
  end
  
  test "login email Correct password is different" do
    get login_path
    assert_template "sessions/new"
    post login_path, params: { session: { email: @user.email,
                                          password: "invalid" } }
    assert_template "sessions/new"
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "from login to logout" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    # 一時的にコメントアウト
    # assert_select "a[href=?]", login_path
    # # assert_select "a[href=?]", logout_path
    # assert_select "a[href=?]", user_path(@user)
    # delete logout_path
    # assert_not is_logged_in?
    # assert_redirected_to login_url
    # follow_redirect!
    # assert_select "a[href=?]", login_path
    # assert_select "a[href=?]", logout_path
    # assert_select "a[href=?]", user_path(@user), count: 0
  end

  test "remember login" do
    log_in_as(@user, remember_me: "1")
    assert_not_empty cookies[:remember_token]
  end

  test "not remember login" do
    # cookies保存
    log_in_as(@user, remember_me: '1')
    delete logout_path
    # cookies削除
    log_in_as(@user, remember_me: '0')
    assert_empty cookies[:remember_token]
  end
end
