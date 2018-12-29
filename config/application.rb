# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

require_relative '../app/middleware/castle_kid'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TazkiyahMvp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    require 'castle/middleware/railtie'
  end
end
