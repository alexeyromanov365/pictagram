class PersonController < ApplicationController
  before_action :user, only: [:followers, :following]
  before_action :authenticate_user!

  def profile
    @feed = current_user.feed_photos.order(created_at: :desc)
  end

  def followers
    @followers = user.followers
  end

  def following
    @following = user.following
  end

  private

  def user
    User.find(params[:user_id])
  end
end
