class UsersController < ApplicationController

  before_action :set_user
  before_action :check_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def show
    @tweets = @user.tweets.paginate(page: params[:page]).order('created_at DESC')
    respond_to do |format|
      format.js
      format.html
    end
  end

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

  def followers
    @followers = @user.inverse_friends.paginate(page: params[:page])
    respond_to do |format|
      format.js
      format.html
    end
  end

  def following
    @following = @user.friends.paginate(page: params[:page])
    respond_to do |format|
      format.js
      format.html
    end
  end

  def favorites
    @favorites = @user.tweets.joins(:favorites).paginate(page: params[:page])
    respond_to do |format|
      format.js
      format.html
    end
  end

  def retweets
    @retweets = @user.retweets.paginate(page: params[:page]).order('created_at DESC')
    respond_to do |format|
      format.js
      format.html
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :password,
                                 :about, :location, :website, :avatar, :cover)
  end

  def check_user
    if @user != current_user
      redirect_to root_path
    end
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end

end
