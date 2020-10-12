class RoomsController < ApplicationController
  before_action :set_room, only: [:show]
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @rooms = Room.includes(:user).order("created_at DESC")
  end

  def new
    @room = Room.new
  end

  def create
    Room.create(room_params)
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
  end

  def show
    @message = Message.new
    @messages = @room.messages.includes(:user)
  end

  private
  def room_params
    params.require(:room).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
