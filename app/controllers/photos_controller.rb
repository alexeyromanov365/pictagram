class PhotosController < ApplicationController
  before_action :set_album
  before_action :set_photo, only: [:show, :edit, :destroy, :update]
  #load_and_authorize_resource

  # GET /photos
  # GET /photos.json
  def index
    @photos = @album.photos
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
    @photo
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.create(photo_params)
    @album.photos << @photo

    respond_to do |format|
      if @photo.save
        format.html { redirect_to [@album, @photo], notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to [@album, @photo], notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to [@album, @photo], notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:album_id])
    end

    def set_photo
      @photo = @album.photos.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :description, :picture, :album_id)
    end
end