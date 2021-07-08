class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]

  def index
    @saizy = Saizy.find(params[:saizy_id])
    @reviews = @saizy.reviews
    @reviews_all = @saizy.reviews.order(created_at: :desc).limit(3)
    @review_page = Review.page(params[:page]).per(5)
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
