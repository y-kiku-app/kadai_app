# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery

  private

  def after_sign_in_path_for(resource)
    case resource
    when User
      mypage_show_path
    when AdminUser
      rails_admin_path
    end
  end

  def after_sign_out_path_for(_resource)
    mypage_logout_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name uid image provider])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name uid image provider])
  end
end
