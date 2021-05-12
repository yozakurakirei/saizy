class SaiziesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  
  def index
    @saizies = Saizy.all
    @microposts = Micropost.all
  end

  def show
    @saizy = Saizy.find(params[:id])
    require_login if @saizy.draft?
  end

  def new
    @saizy = Saizy.new
  end

  def create
    @saizy = current_user.saizies.build(saizy_params)
    @saizy.user_id = current_user.id
    if @saizy.save
      flash[:info] = "投稿が完了しました"
      redirect_to saizy_path(@saizy)
    else
      render 'new'
    end
  end

  def edit
    @saizy = Saizy.find(params[:id])
  end

  def update
    @saizy = Saizy.find(params[:id])
    @saizy.update(saizy_params)
    redirect_to saizy_path(@saizy)
  end

  private
    def saizy_params
      params.require(:saizy).permit(:content,:name, :title, :place, :open, :close, :start, :finish, :status, images: [])
    end

    def require_login
      redirect_to login_path if !logged_in?
    end
end
