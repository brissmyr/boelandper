# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# require_relative '../app/middleware/castle_kid'

require_relative '../app/lib/castle_user_id_middleware'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module TazkiyahMvp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.middleware.use ::CastleUserIdMiddleware

    # require 'castle/middleware/railtie'
  end
end
