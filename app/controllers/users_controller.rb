class UsersController < ApplicationController

  before_action :set_user
  before_action :authenticate_user!

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :password,
                                 :about, :location, :website, :avatar, :cover)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
