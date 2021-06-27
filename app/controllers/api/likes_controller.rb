class Api::LikesController < ApplicationController::API

  def index
    render json: Like.filter_by_saizy(params[:saizy_id].select(:id, :user_id, :saizy_id))
  end

  def create
    current_user.likes.create!(likes_params)
    head :created
  end

  def destroy
    current_user.likes.find(params[:id]).destroy!
    head :ok
  end

  private
    def likes_params
      params.require(:like).permmit(:saizy_id)
    end
end
