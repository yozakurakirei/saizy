class UserMailer < ApplicationMailer

  # アカウント有効化
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Saizyへようこそ！会員登録を有効にしてね！"
  end


  # パスワードリセット
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "【Saizy】パスワード再設定のご案内"
  end
end
