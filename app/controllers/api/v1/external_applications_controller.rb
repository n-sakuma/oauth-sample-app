module Api::V1
  class ExternalApplicationsController < BaseController
    doorkeeper_for :all
    respond_to :json

    def show
      respond_with current_app.as_json
    end
  end
end
