class LikesController < ApplicationController
  
  def create
    if current_user.like_this(clicked_post)
      flash[:success] = '投稿に「いいね！」しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'すでに「いいね！」しています'
      redirect_back(fallback_location: root_path)
      # 「いいね！」削除ボタンを実装すると、↑上記の2行は不要になります
    end
  end

  def destroy
    current_user.likes.find_by(post_id: params[:post_id]).destroy
    flash[:danger] = '「いいね！」を解除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def clicked_post
    Post.find(params[:post_id])
  end

end
