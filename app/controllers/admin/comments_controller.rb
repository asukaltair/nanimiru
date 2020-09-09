class Admin::CommentsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @comments = Comment.all.order("created_at DESC")
  end

  def update
    comment = Comment.find(params[:id])
    if comment.is_active == true
      comment.update(is_active: false)
      redirect_back(fallback_location: root_path)
    else
      comment.update(is_active: true)
      redirect_back(fallback_location: root_path)
    end
  end

end
