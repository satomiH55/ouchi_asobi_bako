class PostsController < ApplicationController

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.published.page(params[:page]).reverse_order
    # 単一の検索窓で複数カラムを検索
    if params[:search].present?
      search_query = "%#{params[:search]}%"
      @posts = @posts.where(
        'title LIKE :query OR age_group LIKE :query OR tool LIKE :query OR step LIKE :query',
        query: search_query
      )
    end
    if params[:category_id].present?
      @posts = @posts.where(category_id: params[:category_id])
    end
  end

  def show
    @post = Post.includes(:category).find(params[:id])
    @categories = Category.all
    @category_name = @post.category&.name || "未分類"
    # 閲覧数のカウント処理
    unless ViewCount.find_by(user_id: current_user.id, post_id: @post.id, created_at: Time.zone.now.all_day)
      current_user.view_counts.create(post_id: @post.id)
    end
    # コメント関連の処理
    @comment = Comment.new
    @comments = @post.comments.page(params[:page]).per(7).reverse_order
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end

  def update
    @post = Post.find(params[:id])
    # 「保存する」ボタンが押された場合、ステータスを変更
    if params[:publish].present?
      @post.status = :published
    end

    if @post.update(post_params)
      redirect_to posts_path(@post.id) # postでなくposts
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path, notice: "投稿が削除されました"
  end

  def confirm
    @posts = current_user.posts.draft.page(params[:page]).reverse_order
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :title, :age_group, :tool, :step, :image, :status, :category_id)
  end
  
end