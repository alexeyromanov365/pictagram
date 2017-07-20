require "application_responder"
require 'rake'
load 'Rakefile'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    person_profile_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  def access_denied(*args)
    head :forbidden
  end
end
