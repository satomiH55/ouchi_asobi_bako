class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  
  def index
    @users = User.page(params[:page]).per(5).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(8).reverse_order
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  
    # 現在のユーザーと表示中のユーザーが共通のルームを検索
    @isRoom = false
    @roomId = nil
  
    common_room = Room.joins(:entries)
                      .where(entries: { user_id: current_user.id })
                      .joins(:entries)
                      .where(entries: { user_id: @user.id })
                      .distinct
                      .first
  
    if common_room
      @isRoom = true
      @roomId = common_room.id
    else
      @room = Room.new
      @entry = Entry.new
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "プロフィールを更新しました。"
    else
      @posts = @user.posts.page(params[:page]).per(8).reverse_order
      flash.now[:alert] = "プロフィールの更新に失敗しました。"
      render :edit, status: :unprocessable_entity
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