class Admin::UsersController < ApplicationController

	before_action :authenticate_admin!
	before_action :ensure_admin_user, only: [:show, :update]

	def index
		@users = User.all
	end

	def show
		@photos = @user.photos
	end

	def update
		if @user.is_active == true
			@user.update(is_active: false)
			redirect_back(fallback_location: root_path)
		else
			@user.update(is_active: true)
			redirect_back(fallback_location: root_path)
		end
	end

	private

	def ensure_admin_user
		@user = User.find(params[:id])
	end

end
