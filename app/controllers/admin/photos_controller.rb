class Admin::PhotosController < ApplicationController

	before_action :authenticate_admin!
	before_action :ensure_admin_photo, only: [:show, :update]

	def index
		@photos = Photo.all
	end

	def show
	end

	def update
		if @photo.is_active == true
			@photo.update(is_active: false)
			redirect_to admin_photo_path
		else
			@photo.update(is_active: true)
			redirect_to admin_photo_path
		end
	end

	private

	def ensure_admin_photo
		@photo = Photo.find(params[:id])
	end

end
