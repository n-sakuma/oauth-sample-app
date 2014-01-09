class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    app = ExternalApplication.find_by(provider: auth["provider"], uid: auth["uid"].to_s) || ExternalApplication.create_with_omniauth(auth)
    session[:app_id] = app.id
    session[:access_token] = auth["credentials"]["token"]
    redirect_to root_url
  end

  def destroy
    session[:app_id] = nil
    session[:access_token] = nil
    redirect_to root_url
  end
end
