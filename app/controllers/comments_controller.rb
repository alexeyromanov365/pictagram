class CommentsController < ApplicationController
  before_action :set_user
  before_action :set_album
  before_action :set_photo
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :user
  load_and_authorize_resource :album, through: :user
  load_and_authorize_resource :photo, through: :album
  load_and_authorize_resource through: :photo
  respond_to :html, :xml, :json

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
    if @comment.save
      Notifications::CommentNotification.new(@comment).notify
      respond_to do |format|
        format.js
        format.html { redirect_to [@album, @photo] }
      end
    end
  end

  def update
    respond_with @comment.update(comment_params), location: [@album, @photo, @comment]
  end

  def destroy
    @comment.destroy
    respond_with @comment, location: user_album_photos_path(@user, @album)
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
