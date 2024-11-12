class ApplicationController < ActionController::Base
  skip_forgery_protection
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit::Authorization

  after_action :verify_authorized, unless: :skip_authorization_check?
  after_action :verify_policy_scoped, only: :index, unless: :skip_policy_scope_check?

  before_action :authenticate_user!, unless: :home_controller?
  # before_action :configure_permitted_parameters, if: :devise_controller?


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end


  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."

    redirect_back fallback_location: root_url
  end

  def skip_authorization_check?
    devise_controller? || home_controller?
  end

  def skip_policy_scope_check?
    devise_controller? || home_controller?
  end

  def home_controller?
    controller_name == 'home'
  end
end
