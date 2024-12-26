class MessagesController < ApplicationController
  # ログインしていないユーザーが特定のアクションを実行できないようにする
  # :authenticate_user! は Devise のメソッドで、ログインを確認するフィルタ
  # :only => [:create] により、create アクションのみに適用
  before_action :authenticate_user!, :only => [:create]

  # メッセージを作成するアクション
  def create
    # フォームから送信されたデータをもとに Message モデルの新しいインスタンスを作成
    @message = Message.new(message_params)
    # 現在ログインしているユーザー（current_user）の ID をメッセージに紐付け
    @message.user_id = current_user.id
    # メッセージの保存が成功した場合
    if @message.save
      # メッセージが紐付いているルーム（@message.room）のページにリダイレクト
      redirect_to room_path(@message.room)
    else
      # 保存に失敗した場合、元のページにリダイレクト
      # fallback_location はリダイレクト先が特定できない場合のデフォルトとして root_path を指定
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  
  # Strong Parameters を使用して許可するパラメータを制限
  # params.require(:message) はリクエスト内の :message を必須とし
  # .permit(:room_id, :message) で room_id と message のみを許可
  def message_params
    params.require(:message).permit(:room_id, :message)
  end
end