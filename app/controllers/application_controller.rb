# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(_resource)
    mypage_show_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path # ログアウト後に遷移するpathを設定
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name uid image provider])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name uid image provider])
  end
end
