class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:query].nil?
      @activities = Activity.all
    else
      @location = params[:query]
      @sport_sessions = SportSession.near(@location, 50)
      @activities = @sport_sessions.map do |sport_session|
        sport_session.activity
      end
    end
  end
end
