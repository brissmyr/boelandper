# frozen_string_literal: true

class Api::LoginController < ActionController::Base
  respond_to :json

  def create
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.success?
      request.env['api_user'] = command.result[:user]
      render json: { auth_token: command.result[:jwt] }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
