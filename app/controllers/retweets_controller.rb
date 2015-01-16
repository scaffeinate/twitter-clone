class RetweetsController < ApplicationController

  before_action :authenticate_user!

  def create
    @retweet = Retweet.create(retweet_id: params[:tweet_id], retweeter: current_user)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @retweet = Retweet.find(params[:id])
    @retweet.destroy
    respond_to do |format|
      format.js
    end
  end
end
