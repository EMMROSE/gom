class SportSessionChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    raise
    sport_session = sport_session.find(params[:id])
    stream_for sport_session
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
