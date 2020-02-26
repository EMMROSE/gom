class MessagesController < ApplicationController
  def create
    @sport_session = SportSession.find(params[:sport_session_id])
    @chatroom = Chatroom.where(sport_session_id: @sport_session.id).first
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      redirect_to sport_session_path(@sport_session)
    else
      render "sport_session/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
