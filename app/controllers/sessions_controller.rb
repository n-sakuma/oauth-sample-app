class SessionsController < ApplicationController
  def new
    session[:return_to] = params[:return_to] if params[:return_to]
  end

  def create
    if app = ExternalApplication.find_by(name: params[:name]) 
      session[:app_id] = app.id
      if session[:return_to]
        redirect_to session[:return_to]
        session[:return_to] = nil
      else
        redirect_to root_url
      end
    else
      flash.now.alert = "App name is invalid"
      render :new
    end
  end

  def destroy
    session[:app_id] = nil
    redirect_to new_session_url
  end
end
