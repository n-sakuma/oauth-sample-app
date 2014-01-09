class ExternalApplicationsController < ApplicationController

  def new
    @app = ExternalApplication.new
  end

  def create
    @app = ExternalApplication.new(app_params)
    if @app.save
      session[:app_id] = @app.id
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def app_params
    params.require(:app).permit(:name)
  end
end
