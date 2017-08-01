class AlbumsController < ApplicationController
  respond_to :html, :json
  after_action :update_rake_operations, only: [:create, :update, :destroy]
  load_and_authorize_resource :user
  load_and_authorize_resource :album, through: :user
  before_action :authenticate_user!, except: [:show, :index]

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
    @album.tags = TagService.new(params[:album][:tags]).tags if @album.save
    respond_with @album, location: [@user, @album]
  end

  def update
    if @album.update(album_params) && @album.tags = TagService.new(params[:album][:tags]).tags
    # @album.tags = TagService.new(params[:album][:tags]).tags
    # respond_with @album.update(album_params), location: [@user, @album]
      respond_with @album, location: [@user, @album]
    end
  end

  def destroy
    @album.destroy
    respond_with @album, location: [@user, @album]
  end

  private

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


  # def update
  #   if @album.update_attributes(album_params) && @album.tags = TagService.new(params[:album][:tags]).tags
  #     flash[:success] = "Album was successfully updated"
  #     redirect_to user_album_path(@user, @album)
  #   else
  #     flash[:alert] = "Error updating album"
  #     render "edit"
  #   end
  # end