class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @location = params[:query]
    @sport_sessions = SportSession.near(@location, 30)
  end
end
