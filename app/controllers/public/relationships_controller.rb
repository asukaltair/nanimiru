class Public::RelationshipsController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_user, only: [:followings, :followers]

  def create
    current_user.follow(params[:followed_id])
    redirect_to user_path
  end

  def destroy
    current_user.unfollow(params[:followed_id])
    redirect_to user_path
  end

  def followings
    @users = @user.following_user
  end

  def followers
    @users = @user.follower_user
  end

  private

  def ensure_user
    @user = User.find_by(name: params[:name])
  end

end
