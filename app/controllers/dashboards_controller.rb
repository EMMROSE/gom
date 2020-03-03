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
  end
end
