class HomeController < ApplicationController
  def index
    @tweets = Tweet.paginate(page: params[:page]).order('created_at DESC')
  end
end
