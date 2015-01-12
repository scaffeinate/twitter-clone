class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweets = Tweet.where("user_id in (?) OR user_id = ?", current_user.friend_ids.join(', '), current_user).paginate(page: params[:page]).order('created_at DESC')
  end

  def find_friends
    @users = User.where("id not in (?) OR id != ?", current_user.friend_ids.join(', '), current_user).paginate(page: params[:page])
  end
end
