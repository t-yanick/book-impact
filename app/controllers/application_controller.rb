class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) do |u|
  #     u.permit(:name, :username, :email, :password,
  #              :password_confirmation, :photo, :cover_image)
  #   end
  #   devise_parameter_sanitizer.permit(:account_update) do |u|
  #     u.permit(:name, :username, :email, :password,
  #              :current_password, :photo, :cover_image)
  #   end
  # end

  def configure_permitted_parameters
    added_attrs = %i[name username email password password_confirmation remember_me photo cover_image]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def after_sign_in_path_for(_resource)
    opinions_path
  end
end
