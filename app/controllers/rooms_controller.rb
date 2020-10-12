class RoomsController < ApplicationController
  
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    Room.create(room_params)
  end

  private
  def room_params
    params.require(:room).permit(:name, :image, :text)
  end

end
