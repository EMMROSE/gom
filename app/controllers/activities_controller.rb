class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @location = params[:query]
    raise
    @sessions = Session.near(@location, 30)
  end
end
