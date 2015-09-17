class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :last_name, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :last_name, :email, :password, :password_confirmation, :current_password) }
  end

  def set_search
    @search = Book.search(params[:q])
  end
end
