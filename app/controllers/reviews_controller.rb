class ReviewsController < ApplicationController
  def index
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:info] = "口コミ投稿が完了しました！"
      redirect_to saizy_path(@review.saizy)
    else
      @saizy = Saizy.find(params[:id])
      flash[:dangar] = "投稿に失敗しました"
      render "saizies/show"
    end
  end

  private
    def review_params
      params.require(:review).permit(:saizy_id, :score, :content)
    end
end
