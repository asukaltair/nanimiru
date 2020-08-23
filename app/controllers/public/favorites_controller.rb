class Public::FavoritesController < ApplicationController

	before_action :authenticate_user!

	def create
		@photo = Photo.find(params[:photo_id])
		favorite = Favorite.new
		favorite.user_id = current_user.id
		favorite.photo_id = @photo.id
		favorite.save
	end

	def destroy
		@photo = Photo.find(params[:photo_id])
		favorite = @photo.favorites.find_by(user_id: current_user.id)
		favorite.destroy
	end

end
