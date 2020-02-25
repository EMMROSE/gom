class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @sessions = Session.all
  end
end
