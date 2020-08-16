class Public::CommentsController < ApplicationController

	def create
		photo = Photo.find(params[:photo_id])
		comment = Comment.new(comment_params)
		comment.user_id = current_user.id
		comment.photo_id = photo.id
		comment.save
		redirect_to photo_path(photo)
	end

	def edit
		@photo = Photo.find(params[:photo_id])
		@comment = Comment.find(params[:id])
	end

	def update
		@photo = Photo.find(params[:photo_id])
		@comment = Comment.find(params[:id])
		@comment.update(comment_params)
		redirect_to photo_path(@photo)
	end

	def destroy
		@photo = Photo.find(params[:photo_id])
		@comment = Comment.find_by(id: params[:id], photo_id: params[:photo_id])
		@comment.destroy
		redirect_to photo_path(@photo)
	end

	private

	def comment_params
		params.require(:comment).permit(:comment, :star)
	end

end
