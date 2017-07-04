class PersonController < ApplicationController
  def profile
    @feed = current_user.feed_photos.order(created_at: :desc)
  end
end
