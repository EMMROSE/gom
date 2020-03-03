class DashboardsController < ApplicationController
  def dashboard
    current_user_owned_participations = current_user.session_users.where(owner: true)
    @current_user_owned_sessions = current_user_owned_participations.map do |participation|
    participation.sport_session
    end
  end
end
