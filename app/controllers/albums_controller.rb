class AlbumsController < ApplicationController
  before_action :set_user
  before_action :set_album, only: [:show, :edit, :update, :destroy]

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
    current_user.albums << @album

    respond_to do |format|
      if @album.save
        format.html { redirect_to [@user, @album], notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to [@user, @album], notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to [@user, @album], notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :description, :all_tags)
    end
end
