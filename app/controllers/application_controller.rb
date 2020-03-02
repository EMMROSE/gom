class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :sport_session_new

  private

  def sport_session_new
    @sport_session = SportSession.new
  end
end
