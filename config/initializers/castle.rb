# frozen_string_literal: true

Castle::Middleware.configure do |config|
  config.file_path = Rails.root.join('config/castle.yml')
  config.app_id = ENV.fetch('CASTLE_APP_ID')
  config.api_secret = ENV.fetch('CASTLE_API_SECRET')
  config.tracker_url = ENV['CASTLE_TRACKER_URL'] if ENV['CASTLE_TRACKER_URL'].present?
  config.logger = Rails.logger

  config.services.provide_user = lambda do |request, secure|
    if (user = (request.env['api_user'] || request.env['warden']&.user)) # for logged users
      user
    elsif (user_id = request.session.fetch('warden.user.user.key', []).dig(0, 0)) # when logging out
      User.find_by(id: user_id) if secure
    elsif request.form_data? && (email = request.params.dig('user', 'email')) # for login failed
      User.find_by(email: email) if secure && URI::MailTo::EMAIL_REGEXP.match(email.to_s)
    elsif (challenge = request.params.dig('user', 'challenge'))
      User.find_by(otp_session_challenge: challenge) if secure
    elsif (reset_token = request.params.dig('user', 'reset_password_token'))
      digest_reset_token = Devise.token_generator.digest(User, :reset_password_token, reset_token)
      User.find_by(reset_password_token: digest_reset_token) if secure
    end
  end
end
