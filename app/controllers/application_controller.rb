class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from OAuth2::Error do |exception|
    if exception.response.status == 401
      session[:app_id] = nil
      session[:access_token] = nil
      redirect_to root_url, alert: "Access token expired, try signing in again."
    end
  end

private

  def oauth_client
    setting = Setting.first
    @oauth_client ||= OAuth2::Client.new(setting.oauth_id, setting.oauth_secret, site: "http://localhost:3000")
  end

  def access_token
    if session[:access_token]
      @access_token ||= OAuth2::AccessToken.new(oauth_client, session[:access_token])
    end
  end

  def current_app
    @current_app ||= ExternalApplication.find(session[:app_id]) if session[:app_id]
  end
  helper_method :current_app
end
