class TweetsController < ApplicationController

  before_action :authenticate_user!

  def create
    @tweet = Tweet.new(tweet_params) do |tweet|
      tweet.user = current_user
      tweet.parent_id = params[:parent_id]
    end
    respond_to do |format|
      format.js
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet_id = params[:id]
    respond_to do |format|
      format.js
    end
  end

  def reply
    @tweet = Tweet.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:tweet_text, :location, :media)
  end

end
