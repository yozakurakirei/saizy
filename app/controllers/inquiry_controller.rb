class InquiryController < ApplicationController
  def index
    @inquiry = Inquiry.new
    render :action => 'index'
  end

  def confirm
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    if @inquiry.valid?
      # 成功 確認画面表示
      render :action => 'confirm'
    else
      # 失敗 入力画面を再表示
      render :action => 'index'
    end
  end

  def thanks
    # 送信画面
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    InquiryMailer.received_email(@inquiry).deliver
    
    # 成功画面を表示
    render :action => 'thanks'
  end
end
