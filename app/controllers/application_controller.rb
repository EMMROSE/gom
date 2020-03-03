class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :sport_session_new
  before_action :notifications_generation
  private

  def sport_session_new
    @sport_session = SportSession.new
  end

  def notifications_generation
    if current_user && current_user.sport_sessions != nil
      ss = current_user.sport_sessions
      @sport_sessions = ss.select do |sport_session|
        sport_session.owner == current_user
      end
      if @sport_sessions == nil
        @pending_session_users = nil
      else
        @pending_session_users = @sport_sessions.map do |sport_session|
          sport_session.session_users.where(status: "pending")[0]
        end
      end
    end
  end
end
