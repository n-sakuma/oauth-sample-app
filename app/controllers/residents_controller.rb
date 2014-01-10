class ResidentsController < ApplicationController
  def index
    @residents = access_token ? access_token.get('/api/residents').parsed : []
  end

  def show
    @resident = access_token ? access_token.get("/api/residents/#{params[:id]}").parsed : []
  end
end
