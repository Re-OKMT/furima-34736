class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?  # configure_permitted_parametersを防ぐ
  # before_action :basic_auth #Basic認証は全てのコントローラで行いたい

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :family_name, :first_name, :kana_family_name, :kana_first_name,
                                             :birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']  # 環境変数を読み込む記述に変更
    end
  end
end
