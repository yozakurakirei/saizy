class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&. authenticate(params[:session][:password])
      # マイページに移るようにする
      log_in user
      redirect_to user
    else
      # ログイン失敗の時のエラーを表示
      flash.now[:danger] = "メールアドレスかパスワードに誤りがあります"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
