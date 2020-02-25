class ActivitiesController < ApplicationController
  def index
    @location = params[:query]
    raise
    @sessions = Session.near(@location, 30)
  end
end
