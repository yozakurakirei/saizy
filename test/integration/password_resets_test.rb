require "test_helper"

class PasswordResetsTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:admin)
  end

  test "password resets" do
    get new_password_reset_path
    assert_template 'password_resets/new'
    assert_select 'input[name=?]', 'password_reset[email]'
    #アドレスが無効
    post password_resets_path, params: { password_reset: { email: "" } }
    assert_not flash.empty?
    assert_template 'password_resets/new'
    #アドレスが有効
    post password_resets_path,
      params: { password_reset: { email: @user.email } }
    assert_not_equal @user.reset_digest, @user.reload.reset_digest
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to root_url
    #パスワード再設定用フォーム
    user = assigns(:user)
    #フォームのアドレスが無効
    get edit_password_reset_path(user.reset_token, email: "")
    assert_redirected_to root_url
    #無効なユーザー
    user.toggle!(:activated)
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_redirected_to root_url
    user.toggle!(:activated)
    #アドレス有効、token無効
    get edit_password_reset_path('wrong token', email: user.email)
    assert_redirected_to root_url
    #アドレス、token有効
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_template 'password_resets/edit'
    assert_select 'input[name=email][type=hidden][value=?]', user.email
    #無効なパスワードと確認
    patch password_reset_path(user.reset_token),
          params: { email: user.email,
                    user: { password:    "foobar",
                            password_confirmation: "foofoo" } }
    # assert_select 'div#error_explanation' エラー文なのでカット
    #パスワードが空
    patch password_reset_path(user.reset_token),
          params: { email: user.email,
                    user: { password: "",
                            password_confirmation: "" } }
    #有効なパスワードと確認
    patch password_reset_path(user.reset_token),
          params: { email: user.email,
                    user: { password: "foobar",
                            password_confirmation: "foobar" }}
    assert is_logged_in?
    assert_not flash.empty?
    assert_redirected_to user
    assert_nil user.reload.reset_digest
  end

end
