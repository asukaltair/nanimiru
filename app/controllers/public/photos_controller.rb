class Public::PhotosController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :ensure_photo, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      ids = Relationship.where(follower_id: current_user).pluck(:followed_id)
      ids.push(current_user.id)
      @photos = Photo.where(user_id: ids)
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
    if @photo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @photo.comments
  end

  def edit
    if @photo.user.id != current_user.id
      redirect_to root_path
    end
  end

  def update
    if @photo.update(photo_params)
      redirect_to photo_path
    else
      render :edit
    end
  end

  def destroy
    if @photo.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @photos = Photo.all
    @word = params[:search]
    @users = User.where('name LIKE ?', "%#{params[:search]}%")
    # act-as-taggable-on のLIKE検索は下記の wild/anyを用いる
    @photo_tags = Photo.tagged_with(params[:search], :wild => true, :any => true)
  end

  private

  def ensure_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(
      :image,
      :text,
      :tag_list)
  end

end
