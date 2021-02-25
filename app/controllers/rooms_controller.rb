class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
  end

  def create
  end

  private

  def room_params
    
  end
end
