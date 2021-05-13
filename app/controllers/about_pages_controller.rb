class AboutPagesController < ApplicationController
  def home
    @saizy = Saizy.find(params[:id])
    @comment = @saizy.comments.build
  end

  def about
  end
end
