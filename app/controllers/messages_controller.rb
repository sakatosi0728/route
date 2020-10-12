class MessagesController < ApplicationController
  def create
    message = Message.create(message_params)
    redirect_to "/rooms/#{message.room.id}"
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
