class RoomsController < ApplicationController 
  before_action :authenticate_user!

  def create
    @room = Room.create(user_id: current_user.id)
    @current_entry = Entry.create(user_id: current_user.id, room_id: @room.id)
    
    # params[:entry] が存在し、params[:entry][:user_id] が存在する場合に処理
    if params.dig(:entry, :user_id).present?
    # 同じユーザーとの既存のチャットルームを探す
    room = Room.joins(:entries).where(entries: { user_id: params[:entry][:user_id] }).first

      if room
        # 既存のルームが見つかった場合、そのルームを使ってエントリーを作成
        @another_entry = Entry.create(user_id: params[:entry][:user_id], room_id: room.id)
      else
         # ルームが見つからなければ新しくルームを作成
        @room = Room.create(user_id: current_user.id)
        @another_entry = Entry.create(user_id: params[:entry][:user_id], room_id: @room.id)
      end
        redirect_to room_path(@room)
      end
    end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
      @my_account = current_user.id
    else
      redirect_back(fallback_location: root_path)
    end
  end
end