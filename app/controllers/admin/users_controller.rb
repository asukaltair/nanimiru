class Admin::UsersController < ApplicationController

	before_action :authenticate_admin!
	before_action :ensure_admin_user, only: [:show, :update]

	def index
		@users = User.all
	end

	def show
	end

	def update
		if @user.is_active == true
			@user.update(is_active: false)
			redirect_to admin_user_path
		else
			@user.update(is_active: true)
			redirect_to admin_user_path
		end
	end

	private

	def ensure_admin_user
		@user = User.find(params[:id])
	end

end
