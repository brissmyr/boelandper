# frozen_string_literal: true

class Api::ApiController < ActionController::Base
  before_action :authenticate_request

  attr_reader :current_user

  respond_to :json

  def list
    # fake API resource
    render json: []
  end

  private

  def json_request
      request.format.json?
  end

  def authenticate_request
      @current_user = AuthorizeApiRequest.call(request.headers).result
      render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
