class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_search

  def set_search
    @search = Saizy.ransack(params[:q])
    @saerch_saizies = @search.result(distinct: true).order(created_at: "DESC").includes(:user)
  end

  private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
end
