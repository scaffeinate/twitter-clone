class UsersController < ApplicationController

  before_action :set_user
  before_action :authenticate_user!

  def update
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :password,
                                 :about, :location, :website, :avatar, :cover)
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end

end
