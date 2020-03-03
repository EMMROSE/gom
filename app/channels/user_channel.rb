class UserChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    owner = User.find(params[:id])
    stream_for owner
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
