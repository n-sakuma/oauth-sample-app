module Api::V1
  class ResidentsController < BaseController
    doorkeeper_for :all

    def index
      res = HTTParty.get('http://localhost:4000/api/residents')
      render json: res
    end

    def show
      res = HTTParty.get("http://localhost:4000/api/residents/#{params[:id]}")
      render json: res
    end
  end
end
