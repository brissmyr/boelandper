# frozen_string_literal: true

class CastleUserIdMiddleware
  def initialize(app)
    @app = app
  end
  
  def call(env)
    status, headers, response = @app.call(env)

    Rack::Request.new(env).session.tap do |session|
      if session["warden.user.user.key"].is_a?(Array)
        headers['X-Castle-User-Id'] = session["warden.user.user.key"][0][0]
      end
    end

    [status, headers, response]
  end
end