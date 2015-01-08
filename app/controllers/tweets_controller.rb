class TweetsController < ApplicationController

  before_action :authenticate_user!

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    @tweet.save
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
    @tweet.destroy
    respond_to do |format|
      format.js
    end

  end

  private
  def tweet_params
    params.require(:tweet).permit(:tweet_text, :location)
  end

end
