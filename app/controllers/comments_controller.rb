class CommentsController < ApplicationController
  before_action :set_user
  before_action :set_album
  before_action :set_photo
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @photo.comments
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = @photo.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@album, @photo], notice: 'Comment was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to [@album, @photo, @comment], notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_album
      @album = Album.find(params[:album_id])
    end

    def set_photo
      @photo = Photo.find(params[:photo_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:user_id, :photo_id, :content)
    end
end
