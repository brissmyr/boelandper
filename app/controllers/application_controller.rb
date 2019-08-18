# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:home, :about, :contact]

  def home
  end

  def about
  end

  def contact
  end

  def secret
  end

  protected

  before_action do
    flash.alert = 'Invalid Email or password.' if params[:failed_error]

    if current_user
      response.headers['X-User-Id'] = current_user.id
      response.headers['X-User-Traits'] = JSON.dump({
        email: current_user.email,
        created_at: current_user.created_at,
        updated_at: current_user.updated_at,
        first_name: current_user.first_name,
        last_name: current_user.last_name
      })
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
