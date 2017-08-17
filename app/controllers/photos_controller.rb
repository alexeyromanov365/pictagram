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
    if @photo.save
      @photo.tags = TagService.new(params[:photo][:tags]).tags if @photo.save
      respond_with @photo, location: [@user, @album, @photo]
    else
      flash[:alert] = @photo.errors.full_messages_for(:base).to_sentence
      render :new
    end
  end

  def update
    if @photo.update(photo_params) && @photo.tags = TagService.new(params[:photo][:tags]).tags
      respond_with @photo, location: [@user, @album, @photo]
    end
  end

  def destroy
    @photo.destroy
    respond_with @photo, location: [@user, @album, @photo]
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :picture, :album_id, :all_tags)
  end

  def update_rake_operations
    task = "search_suggestions:index"
    Rake::Task[task].reenable
    SearchSuggestion.destroy_all
    Rake::Task[task].invoke
  end
end