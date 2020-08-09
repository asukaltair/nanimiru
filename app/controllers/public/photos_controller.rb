class Public::PhotosController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
	before_action :ensure_photo, only: [:show, :edit, :update, :destroy]

	def index
		if user_signed_in?
			@photos = Photo.where(user_id: current_user.id)
		else
			@photos = Photo.all
		end
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.new(photo_params)
		@photo.user_id = current_user.id
		@photo.save
		redirect_to root_path
	end

	def show
	end

	def edit
	end

	def update
		@photo.update(photo_params)
		redirect_to photo_path
	end

	def destroy
		@photo.destroy
		redirect_to root_path
	end

	private

	def ensure_photo
		@photo = Photo.find(params[:id])
	end

	def photo_params
		params.require(:photo).permit(
			:image,
			:text)
	end

end
