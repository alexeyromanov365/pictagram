class AlbumsController < ApplicationController
  before_action :set_user
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @albums = @user.albums
  end

  def show
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def create
    @album = Album.create(album_params)
    @user.albums << @album
    respond_with @album, location: [@user, @album]
  end

  def update
    @album.update(album_params)
    respond_with @album, location: [@user, @album]
  end

  def destroy
    @album.destroy
    respond_with @album, location: [@user, @album]
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :description, :all_tags)
  end
end