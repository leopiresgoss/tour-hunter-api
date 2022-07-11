class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:full_name, :role, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:full_name, :role, :email, :password, :current_password)
    end
  end

  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render jsonapi: resource
    else
      render jsonapi_errors: resource.errors, status: 400
    end
  end
end
