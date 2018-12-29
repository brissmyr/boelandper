# frozen_string_literal: true

class Api::LoginController < ActionController::Base
  respond_to :json

  def create
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
