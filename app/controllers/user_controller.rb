class UserController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]

  def following

  end

  def followers

  end


end
