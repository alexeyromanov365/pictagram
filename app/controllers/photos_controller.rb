class PhotosController < ApplicationController
  respond_to :html, :json
  after_action :update_rake_operations, only: [:create, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  load_and_authorize_resource :user
  load_and_authorize_resource :album, through: :user
  load_and_authorize_resource through: :album 

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
  end

  def create
    @photo = @album.photos.create(photo_params)
    @photo.tags = TagService.new(params[:photo][:tags]).tags
    respond_with @photo, location: [@user, @album, @photo]
  end

  def update
    @photo.tags = TagService.new(params[:photo][:tags]).tags
    respond_with @photo, location: [@user, @album, @photo]
  end

  def destroy
    @photo.destroy
    respond_with @photo, location: [@user, @album, @photo]
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :picture, :album_id, :all_tags, :user)
  end

  def update_rake_operations
    task = "search_suggestions:index"
    Rake::Task[task].reenable
    SearchSuggestion.destroy_all
    Rake::Task[task].invoke
  end
end