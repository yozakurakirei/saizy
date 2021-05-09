class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        flash[:info] = "ログインしました！"
        redirect_back_or user
      else
        message = "まだ登録は完了しておりません"
        message += "メールをお送りしました！チェックをお願いします！"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      # ログイン失敗の時のエラーを表示
      flash.now[:danger] = "メールアドレスかパスワードに誤りがあります"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:info] = "ログアウトしました"
    redirect_to login_url
  end
end
