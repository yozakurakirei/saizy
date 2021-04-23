class UsersController < ApplicationController
  def show 
    @user = User.find(params[:id])
  end
  
  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ログインしました！"
      redirect_to @user
    else 
      render 'signup'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "更新を保存しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                          :password_confirmation, :agreement)
    end
end
