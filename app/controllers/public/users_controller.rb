class Public::UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :ensure_user, only: [:show, :edit, :update]

	def show
		@photos = @user.photos
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to user_path
		end

	end

	private

	def ensure_user
		@user = User.find_by(name: params[:name])
	end

	def user_params
		params.require(:user).permit(
			:name,
			:introduction,
			:email,
			:image)
	end

end
