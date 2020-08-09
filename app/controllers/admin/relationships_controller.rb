class Admin::RelationshipsController < ApplicationController

	before_action :authenticate_admin!
	before_action :ensure_admin_user

	def followings
		@users = @user.following_user
	end

	def followers
		@users = @user.follower_user
	end

	private

	def ensure_admin_user
		@user = User.find(params[:id])
	end

end
