class PostsController < ApplicationController  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to '/top', notice: '投稿が作成されました'
    else
      render :new, alert: '投稿に失敗しました'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :age_group, :tool, :step, :image)
  end

end
