class RetweetsController < ApplicationController

  before_action :authenticate_user!

  def create
    @retweet = Retweet.new(source_tweet_id: params[:tweet_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @retweet = Retweet.new(params[:id])
    respond_to do |format|
      format.js
    end
  end
end
