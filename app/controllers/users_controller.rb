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
      flash[:success] = "ログインしました！"
      redirect_to @user
    else 
      render 'signup'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                          :password_confirmation, :agreement)
      end
end
