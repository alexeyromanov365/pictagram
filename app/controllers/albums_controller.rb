class AlbumsController < ApplicationController
	respond_to :html, :json
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
		if @album.save
			@album.tags = TagService.new(params[:album][:tags]).tags
			respond_with @album, location: [@user, @album]
		else
			flash[:alert] = @album.errors.full_messages_for(:base).to_sentence
			render :new
		end		
	end

	def update
		if @album.update(album_params) && @album.tags = TagService.new(params[:album][:tags]).tags
			respond_with @album, location: [@user, @album]
		end
	end

	def destroy
		@album.destroy
		respond_with @album, location: [@user, @album]
	end

	private

	def album_params
		params.require(:album).permit(:title, :description, :photos_count)
	end
end