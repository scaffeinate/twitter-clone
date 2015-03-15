class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweets = Tweet.where("user_id in (?) OR user_id = ?", current_user.friend_ids, current_user).paginate(page: params[:page]).order('created_at DESC')
    @tweets_count = current_user.tweets.count
    @followers_count = current_user.inverse_friends.count
    @following_count = current_user.friends.count
  end
end
