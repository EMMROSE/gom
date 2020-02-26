class SportSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @sport_sessions = SportSession.all.sort_by {|ss| ss.start_time}
    @markers = @sport_sessions.map do |sport_session|
      {
        lat: sport_session.latitude,
        lng: sport_session.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { sport_session: sport_session }),
        image_url: helpers.asset_url('old-walker.png')
      }
    end
  end

  def show
    @sport_session = SportSession.find(params[:id])
    @current_relevent_session_user = current_user.session_users.find_by(sport_session_id: params[:id])
  end

  def new
    @activities = Activity.all
    @sport_session = SportSession.new
  end

  def create
    @activities = Activity.all
    @sport_session = SportSession.new(sport_session_params)
    @sport_session.activity = Activity.find(params[:activity_id]) if params[:activity_id].present?
    @session_user = SessionUser.new(owner: true, status: 'accepted')
    @session_user.sport_session = @sport_session
    @session_user.user = current_user
    if @sport_session.save
      @session_user.save
      redirect_to sport_session_path(@sport_session)
    else
      render :new
    end
  end

  private

  def sport_session_params
    params.require(:sport_session).permit(:title, :description, :location, :capacity, :activity_id, :level, :start_time, :end_time)
  end

end
