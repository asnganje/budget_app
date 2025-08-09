class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  include Devise::Controllers::Helpers
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:signup, keys: [ :fullname ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :fullname ])
  end
end
