class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in){|u|u.permit(:email,:password,:remember_me)}
    devise_parameter_sanitizer.for(:sign_up){|u|u.permit(:firstname,:middlename,:lastname,:phone,
                                  :email,:password,:password_confirmation,:timezone)}
    devise_parameter_sanitizer.for(:account_update){|u|u.permit(:firstname,:middlename,:lastname,:phone,
                                  :current_password,:password,:password_confirmation,:timezone)}
  end
end
