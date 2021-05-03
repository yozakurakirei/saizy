require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    # assert_match user.first_name
    user = users(:admin)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Saizyへようこそ！会員登録を有効にしてね！", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["saizy.info@example.com"], mail.from
    assert_match user.name,                  mail.body.encoded
    assert_match user.activation_token,      mail.body.encoded
    assert_match CGI.escape(user.email),     mail.body.encoded
  end
end