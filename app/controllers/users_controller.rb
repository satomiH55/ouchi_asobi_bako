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
  
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
  
    if @user.id == current_user.id
      # 自分自身のページの場合は何もしない
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @room = cu.room_id # 共有ルームがある場合、そのルームをセット
          end
        end
      end
    
      if @isRoom
        @roomId = @room # 既存のルームIDを設定
      else # 共有ルームがない場合、新しいルームを作成
        @room = Room.new
        @entry = Entry.new
      end
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