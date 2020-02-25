class SessionUsersController < ApplicationController
  def create
    @session_user = SessionUser.new(owner: false)
    @session_user.user = current_user
    @session_user.sport_session = SportSession.find(params[:sport_session_id])
    @session_user.save
    flash[:notice] = "Great! We will notify when the session owner accept/refuse your request"
    redirect_to sport_session_path(params[:sport_session_id])
  end
end
