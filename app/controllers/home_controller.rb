class HomeController < ApplicationController
  def index
    @tweets = Tweet.where("user_id in (?) OR user_id = ?", current_user.friend_ids.join(', '), current_user).paginate(page: params[:page]).order('created_at DESC')
  end
end
