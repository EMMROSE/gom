class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:query].present?
      @activities = Activity.search_by_location(params[:query])
    else @activities = Activity.all
    end
  end
end
