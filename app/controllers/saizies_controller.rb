class SaiziesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update, :destroy, :mypage]
  

  def index
    @saizies = Saizy.all.limit(20)
    @impressions = Saizy.order(impressions_count: 'DESC')
    @pv_ranking = Saizy.find(Impression.group(:impressionable_id).order('count(impressionable_id) desc').limit(5).pluck(:impressionable_id))
    @tags = @saizies.tag_counts_on(:tags)
  end

  def tag_list
    @saizies = Saizy.all
    @tags = Saizy.tag_counts_on(:tags).order('count DESC')
    if @tag = params[:tag]
      @saizy = Saizy.tagged_with(params[:tag])
    end
    @pages = Saizy.page(params[:page]).per(10)
  end

  def show
    @saizy = Saizy.find(params[:id])
    @saizies = Saizy.all.limit(20)
    impressionist(@saizy, nil, unique: [:session_hash])
    require_login if @saizy.draft?
    @tags = @saizy.tag_counts_on(:tags)
    @review = Review.new
    @reviews = Review.all
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

  # 都道府県別ページ
  def tokyo
    @saizies = Saizy.all.limit(20)
  end
  def chiba
    @saizies = Saizy.all.limit(20)
  end
  def kanagawa
    @saizies = Saizy.all.limit(20)
  end
  def saitama
    @saizies = Saizy.all.limit(20)
  end
  def oosaka
    @saizies = Saizy.all.limit(20)
  end
  def kyoto
    @saizies = Saizy.all.limit(20)
  end
  def nagoya
    @saizies = Saizy.all.limit(20)
  end
  def sapporo
    @saizies = Saizy.all.limit(20)
  end

  def search
  end

  private
    def saizy_params
      params.require(:saizy).permit(:content,:name, :title, :place, :open, :close, :start, :finish, :status,:area, :tag_list, :evaluation, images: [])
    end

    def require_login
      redirect_to login_path if !logged_in?
    end
end
