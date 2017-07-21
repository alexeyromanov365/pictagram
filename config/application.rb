require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pictagram
  class Application < Rails::Application
    config.app_generators.scaffold_controller :responders_controller
    config.load_defaults 5.1
    config.middleware.use "MyMiddleware", "*"
  end
end
