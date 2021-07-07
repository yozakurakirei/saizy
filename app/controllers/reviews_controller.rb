class ReviewsController < ApplicationController
  def index
    @saizy = Saizy.find(params[:saizy_id])
    @reviews = @saizy.reviews
  end

  def create 
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:info] = "口コミの投稿が完了しました"
      redirect_to saizy_reviews_path(@review.saizy)
    else
      @saizy = Saizy.find(params[:id])
      flash[:info] = "投稿に失敗しました"
      render 'saizies/show'
    end
  end

  private
    def review_params
      params.require(:review).permit(:saizy_id, :rate, :title, :comment)
    end
end
