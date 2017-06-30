require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    person_profile_path(current_user)
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
