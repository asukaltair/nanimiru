class Public::FavoritesController < ApplicationController

	def create
		photo = Photo.find(params[:photo_id])
		favorite = Favorite.new
		favorite.user_id = current_user.id
		favorite.photo_id = photo.id
		favorite.save
		redirect_to photo_path(photo)
	end

	def destroy
		@photo = Photo.find(params[:photo_id])
		favorite = @photo.favorites.find_by(user_id: current_user.id)
		favorite.destroy
		redirect_to photo_path(@photo)
	end

end
