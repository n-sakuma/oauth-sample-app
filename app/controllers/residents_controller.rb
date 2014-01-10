class ResidentsController < ApplicationController
  def index
    @residents = access_token ? access_token.get('/api/residents').parsed : []
  end
end
