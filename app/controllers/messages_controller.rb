class MessagesController < ApplicationController
    before_action :authenticate_user!, :only => [:create]
  
    def create
      @message = Message.new(message_params)
      @message.user_id = current_user.id
      if @message.save
        redirect_to room_path(@message.room)
      else
        @room = Room.find(@message.room_id)
        @messages = @room.messages.includes(:user)
        @entries = @room.entries.includes(:user) # 必要なデータを再取得
        render "rooms/show", status: :unprocessable_entity
      end
    end
    
    private
    
    def message_params
      params.require(:message).permit(:room_id, :message)
    end
  end  
