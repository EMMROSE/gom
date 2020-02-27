class MessagesController < ApplicationController
  def create
    @sport_session = SportSession.find(params[:sport_session_id])
    @message = Message.new(message_params)
    @message.sport_session = @sport_session
    @message.user = current_user
    if @message.save
      SportSessionChannel.broadcast_to(
        @sport_session,
        render_to_string(partial: "shared/message", locals: { message: @message })
      )
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
