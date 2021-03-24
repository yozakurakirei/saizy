class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # マイページに移るようにする
      login user
      redirect_to user
    else
      # ログイン失敗の時のエラーを表示
      flash.now[:danger] = "メールアドレスかパスワードに誤りがあります"
      render 'new'
    end
  end

  def destroy
  end
end
