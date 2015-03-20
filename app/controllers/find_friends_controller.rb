class FindFriendsController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.where("id not in (?) AND id != ?", current_user.friend_ids, current_user).paginate(page: params[:page])
    respond_to do |format|
      format.js
      format.html
    end
  end
end
