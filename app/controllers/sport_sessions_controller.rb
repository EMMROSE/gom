class SportSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
     @sport_sessions = SportSession.all

     # Activity filter
     @sport_sessions = @sport_sessions.where(activity: params[:activity]) if params[:activity].present?

     # Open status filter
     @sport_sessions = @sport_sessions.where(open_status: true) if params[:open_status].present?

     # Start time filter
     @sport_sessions = @sport_sessions.where(start_time: params[:start_time]) if params[:start_time].present?

     # Level filter
     @sport_sessions = @sport_sessions.where(level: params[:level]) if params[:level].present?


    @markers = @sport_sessions.map do |sport_session|

      {
        lat: sport_session.latitude,
        lng: sport_session.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { sport_session: sport_session }),
        image_url: helpers.asset_url("#{sport_session.activity.name.downcase}-icon-small.png"),
        id: sport_session.id,
        activity: sport_session.activity.name.downcase
      }
    end
  end

  def show
    @sport_session = SportSession.find(params[:id])

    # Find session users that belongs to THIS Sport Session
    @relevant_session_users = SessionUser.where(sport_session_id: params[:id])

    # Find sport session owner
    session_user_owner = SessionUser.find_by(sport_session_id: params[:id], owner: true)
    @sport_session_owner = User.find(session_user_owner.user_id)

    # Find session users, of the current user, that belongs to THIS Sport Session
    @current_relevant_session_user = current_user.session_users.find_by(sport_session_id: params[:id])
    # Setup Chatroom and Message
    # @chatroom = Chatroom.where(sport_session_id: @sport_session).first
    @messages = @sport_session.messages
    @message = Message.new
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
