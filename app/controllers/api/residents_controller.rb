module Api
  class ResidentsController < ApplicationController
    def index
      render json: Resident.all.as_json
    end

    def show
      render json: Resident.find_by(id: params[:id]).as_json
    end
  end
end
