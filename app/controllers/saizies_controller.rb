class SaiziesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update, :destroy, :mypage]

  def index
    @saizies = Saizy.all.limit(20)
  end

  def show
    @saizy = Saizy.find(params[:id])
    @saizies = Saizy.all.limit(20)
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
    flash[:info] = "編集が完了しました"
    redirect_to saizy_path(@saizy)
  end

  def destroy
    @saizy = Saizy.find(params[:id])
    @saizy.destroy
    flash[:info] = "削除しました。"
    redirect_to saizies_path
  end

  def tokyo
    @saizies = Saizy.all.limit(20)
  end

  def search
  end

  private
    def saizy_params
      params.require(:saizy).permit(:content,:name, :title, :place, :open, :close, :start, :finish, :status,:area, images: [])
    end

    def require_login
      redirect_to login_path if !logged_in?
    end
end
