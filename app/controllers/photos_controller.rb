class PhotosController < ApplicationController
  before_action :set_user
  before_action :set_album
  before_action :set_photo, only: [:show, :edit, :destroy, :update]
  respond_to :html, :json

  def index
    @photos = @album.photos
  end

  def show
    @comment = Comment.new
    render action: 'modal', layout: false if request.xhr?
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo
  end

  def create
    @photo = Photo.create(photo_params)
    @album.photos << @photo
    respond_with @photo, location: -> { @user }
  end

  def update
    respond_with @photo.update(photo_params)
  end

  def destroy
    respond_with @photo.destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_album
    @album = Album.find(params[:album_id])
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :picture, :album_id, :all_tags)
  end
end
