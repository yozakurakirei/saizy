class SimilarsController < ApplicationController
  before_action :call_client, only: :index

  def index
    si = @client.search_items(keywords: keyword_params, SearchIndex: "food")
    @items = si.items
  end

  private 

  def call_client
    require 'paapi'
    @client = Paapi::Client.new(access_key: Rails.application.credentials[:pa_api][:access_key_id],
                                secret_key: Rails.application.credentials[:pa_api][:secret_key],
                                market: :jp,
                                partner_tag: Rails.application.credentials[:pa_api][:associate_tag])
  end

  def keyword_params
    params.require(:keyword)
  end
end
