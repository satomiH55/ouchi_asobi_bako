class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(5).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(8).reverse_order
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])  # ユーザーを取得
    if @user.update(user_params)  # ユーザーの情報を更新
      redirect_to user_path(@user), notice: "プロフィールを更新しました。"  # 成功時はユーザーのページへリダイレクト
    else
      # 更新が失敗した場合、エラーメッセージを表示して編集画面を再表示
      @posts = @user.posts.page(params[:page]).per(8).reverse_order  # 必要に応じて関連する投稿も取得
      flash.now[:alert] = "プロフィールの更新に失敗しました。"  # フラッシュメッセージ
      render :edit, status: :unprocessable_entity  # 編集ページを再表示
    end
  end
  
  def follows
    user = User.find(params[:id])
    @users = user.following_user.page(params[:page]).per(3).reverse_order
  end
  
  def followers
    user = User.find(params[:id])
    @users = user.follower_user.page(params[:page]).per(3).reverse_order
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile, :profile_image)
  end
end