class AlbumsController < ApplicationController
  before_action :set_user
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  after_action :update_rake_operations, only: [:create, :update, :destroy]

  def index
    @albums = @user.albums
  end

  def show
    @album
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def create
    @album = @user.albums.create(album_params)
    @album.tags = TagService.new(params[:album][:tags]).tags
    respond_with @album, location: [@user, @album]
  end

  def update
    @album.tags = TagService.new(params[:album][:tags]).tags
    respond_with @album.update(album_params), location: [@user, @album]
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
    params.require(:album).permit(:title, :description)
  end

  def update_rake_operations
    task = "search_suggestions:index"
    Rake::Task[task].reenable
    SearchSuggestion.destroy_all
    Rake::Task[task].invoke
  end
end