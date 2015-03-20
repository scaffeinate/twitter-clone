class FavoritesController < ApplicationController

  before_action :authenticate_user!

  def create
    @favorite = Favorite.new(tweet_id: params[:tweet_id], user: current_user)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

end
