class SaiziesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  
  def index
  end

  def show
    @saizy = Saizy.find(params[:id])
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
  end

  private
    def saizy_params
      params.require(:saizy).permit(:content, :title, :place, :open, :close, :start, :finish)
    end
end
