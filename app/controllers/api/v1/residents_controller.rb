module Api::V1
  class ResidentsController < BaseController
    doorkeeper_for :all

    def index
      render json: {a: 'a', b: 'b'}
    end
  end
end
