class SessionUsersController < ApplicationController
  def create
    @session_user = SessionUser.new(owner: false)
    @sport_session = SportSession.find(params[:sport_session_id])
    @session_user.user = current_user
    @session_user.sport_session = @sport_session
    @session_user.save!

    UserChannel.broadcast_to(
        @sport_session.owner,
        render_to_string(partial: "shared/requests", locals: { session_user: @session_user })
      )
    flash[:notice] = "Great! We will notify when the session owner accept/refuse your request"
    redirect_to sport_session_path(params[:sport_session_id])
  end

  def accept
    session_user = SessionUser.find(params[:id])
    session_user.status = 'accepted'
    session_user.save
    flash[:notice] = "Request accepted!"
    redirect_to sport_session_path(session_user.sport_session)
  end

  def reject
    session_user = SessionUser.find(params[:id])
    session_user.status = 'rejected'
    session_user.save
    flash[:notice] = "Request rejected!"
    redirect_to  sport_session_path(session_user.sport_session)
  end
end
