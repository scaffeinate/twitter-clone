class RelationshipsController < ApplicationController

  before_action :authenticate_user!

  def create
    @friend = User.friendly.find(params[:friend_id])
    @relationship = Relationship.create(user: current_user, friend: @friend)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @friend = User.find(@relationship.friend_id)
    @relationship.destroy
    respond_to do |format|
      format.js
    end
  end

end
