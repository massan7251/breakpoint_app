class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.create(post_params)
    redirect_to "/rooms/#{@post.room.id}"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/rooms/#{@post.room.id}"
  end

  private

  def post_params
    params.require(:post).permit(:post_a, :post_b, :image).merge(user_id: current_user.id, room_id: params[:room_id])
  end

end
