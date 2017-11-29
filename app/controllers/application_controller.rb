class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(User)
        puts "TESTTSSSS"
        '/login'
      else
        puts "MORE TESTS"
        super
      end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :location, :email, :password, :password_confirm, :avatar, :cover])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:full_name, :location, :email, :password, :password_confirm, :avatar, :cover])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :location, :email, :password, :password_confirm, :avatar, :cover])
  end
end