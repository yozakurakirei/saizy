class ReviewsController < ApplicationController

  def index
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:info] = "口コミ投稿が完了しました！"
      redirect_back(fallback_location: root_path)
    else
      @saizy = Saizy.find(params[:saizy_id])
      flash[:dangar] = "投稿に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def review_params
      params.require(:review).permit(:saizy_id, :comment, :rate)
    end
end
