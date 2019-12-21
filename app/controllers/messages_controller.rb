class MessagesController < ApplicationController
  def index
    @messages = Message.limit(20).order('created_at DESC')
    @message = Message.first
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:content,:text,:image).merge(user_id: current_user.id)
  end
end
