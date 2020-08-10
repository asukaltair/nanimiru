class Admin::CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.is_active == true
			@comment.update(is_active: false)
			redirect_to admin_photo_path(@comment.photo_id)
		else
			@comment.update(is_active: true)
			redirect_to admin_photo_path(@comment.photo_id)
		end
	end

end
