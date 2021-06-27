class LikesController < ApplicationController
  before_action :set_saizy #@saizyにいいねを押した投稿を格納

  def create
    @like = Like.new(user_id: current_user.id, saizy_id: @saizy.id)
    @like.save
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, saizy_id: @saizy.id)
    @like.destroy
  end


  private
    def set_saizy
      @saizy = Saizy.find_by(id: params[:saizy_id])
    end
end
