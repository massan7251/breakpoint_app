class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :restriction_user, only: [:destroy]
  before_action :set_room, only: [:show, :destroy]

  def index
    @room = Room.all.order("created_at DESC")
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room.id)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:agenda, :stanceA, :stanceB).merge(user_id: current_user.id)
  end

  def restriction_user
    unless current_user.id == @room.user_id
      redirect_to root_path
    end
  end

end
