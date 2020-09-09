class Public::CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new(comment_params)
    @comment.comment = params[:comment][:comment]
    @comment.star = params[:comment][:star]
    @comment.user_id = current_user.id
    @comment.photo_id = @photo.id
    @comment.save
    @comments = @photo.comments
  end

  def edit
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.find(params[:id])
    if @photo.user.id != current_user.id || @comment.user.id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to photo_path(@photo)
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.find_by(id: params[:id], photo_id: params[:photo_id])
    @comment.destroy
    @comments = @photo.comments
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :star)
  end

end
