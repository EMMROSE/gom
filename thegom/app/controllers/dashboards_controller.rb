class DashboardsController < ApplicationController
  def dashboard

    @next_sessions = []
    current_user.sport_sessions.map do |sportsession|
      if sportsession.start_time >= Date.today
        @next_sessions << sportsession
      end
    end
    # raise

    @past_sessions = []
    current_user.sport_sessions.map do |sportsession|
      if sportsession.start_time < Date.today
        @past_sessions << sportsession
      end
    end

    current_user_owned_participations = current_user.session_users.where(owner: true)
    @current_user_owned_sessions = current_user_owned_participations.map do |participation|
    participation.sport_session
    end
  end
end
