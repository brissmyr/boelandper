# frozen_string_literal: true

Castle::Middleware.configure do |config|
  config.app_id = ENV.fetch('CASTLE_APP_ID')
  config.api_secret = ENV.fetch('CASTLE_API_SECRET')
end
