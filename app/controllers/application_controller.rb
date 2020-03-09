class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :login_new
  before_action :notifications_generation
  before_action :configure_permitted_parameters, if: :devise_controller?
  private

  def login_new
    @new_user = User.new
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

  def default_url_options
    { host: ENV["https://www.greatoutdoorsmap.com/"] || "localhost:3000" }
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:photo, :username])
  end
end
