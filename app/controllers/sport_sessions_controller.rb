class SportSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @sport_sessions = SportSession.all
  end
end
