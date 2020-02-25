class SportSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @sport_sessions = SportSession.all
    @markers = @sport_sessions.map do |sport_session|
      {
        lat: sport_session.latitude,
        lng: sport_session.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { sport_session: sport_session }),
        image_url: helpers.asset_url('old-walker.png')
      }
    end
  end

  def show
    @sport_session = SportSession.find(params[:id])
  end

end
