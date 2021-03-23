module SessionsHelper
  def login(user)
    if session[:user_id]git 
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end
