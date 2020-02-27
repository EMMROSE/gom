class SportSessionChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    sport_session = SportSession.find(params[:id])
    stream_for sport_session
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
