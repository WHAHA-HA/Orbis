class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, only: :create
  before_filter :configure_permitted_change_password, only: :update

  protected

  # Overwriting the confirmation redirect path method
  def after_inactive_sign_up_path_for(_resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:username, :email, :password)
    end
  end

  def configure_permitted_change_password
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:password, :password_confirmation, :current_password)
    end
  end
end
