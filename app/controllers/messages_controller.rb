class RoomsController < ApplicationController 
  before_action :authenticate_user!

  def create
    # roomを作成
    @room = Room.create(user_id: current_user.id)

    # current_userがこのroomに参加するためのエントリ作成
    current_entry = Entry.create(user_id: current_user.id, room_id: room.id)
    
    # もう一人のエントリを作成 (params[:room]からuser_idを取得)
    another_entry = Entry.create(user_id: params[:room][:user_id], room_id: room.id)
    
    redirect_to room_path(room)
  end

  def index
    # ログインユーザー所属ルームID取得
    current_entries = current_user.entries
    my_room_id = []
    current_entries.each do |entry|
      my_room_id << entry.room.id
    end
    # 自分のroom_idでuser_idが自分じゃないのを取得
    @another_entries = Entry.where(room_id: my_room_id).where.not(user_id: current_user.id)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.all
    @message = Message.new
    @entries = @room.entries
    @another_entry = @entries.where.not(user_id: current_user.id).first
  end
end