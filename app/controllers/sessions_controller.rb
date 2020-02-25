class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @sessions = Session.all

    @markers = @sessions.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { session: session }),
        image_url: helpers.asset_url('old-walker.png')
      }
  end
end
