class CommentsController < ApplicationController
  respond_to :html, :json
  load_and_authorize_resource :user
  load_and_authorize_resource :album, through: :user
  load_and_authorize_resource :photo, through: :album
  load_and_authorize_resource through: :photo

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
        format.html { redirect_to [@album, @photo] }
        format.js
      end
    end
  end

  def update
    respond_with @comment.update(comment_params), location: [@album, @photo, @comment]
  end

  def destroy
    @comment.destroy
    respond_with @comment do |format|
      format.html { redirect_back(fallback_location: root_path) }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :photo_id, :content)
  end
end

