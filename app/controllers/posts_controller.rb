class PostsController < ApplicationController

  def create
    post = Post.create(post_params)
    redirect_to "/rooms/#{post.room.id}"
  end

  private

  def post_params
    params.require(:post).permit(:post_a, :post_b).merge(user_id: current_user.id, room_id: params[:room_id])
  end

end
