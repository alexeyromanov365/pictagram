require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require_relative '../lib/my_middleware'
require_relative '../app/middleware/search_suggestions'

module Pictagram
  class Application < Rails::Application
    config.app_generators.scaffold_controller :responders_controller
    config.load_defaults 5.1
    config.middleware.insert_before 0, SearchSuggestions
    config.middleware.use ::MyMiddleware
    # config.cache_store = :redis_store, "redis://localhost:6379/0/cache", { expires_in: 90.minutes }
  end
end
