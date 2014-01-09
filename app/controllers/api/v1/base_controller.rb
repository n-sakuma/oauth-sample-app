module Api::V1
  class BaseController < ApplicationController

    private

    def current_app
      # @current_app ||= ExternalApplication.find_by(id: session[:app_id])
      if doorkeeper_token
        @current_app ||= ExternalApplication.find(doorkeeper_token.resource_owner_id)
      end
    end
  end
end
