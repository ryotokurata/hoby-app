class ChatsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:message_id])
    @chat = Chat.new
    @messages = @group.messages
    @chats = @message.chats.includes(:user).page(params[:page]).per(10)
  end

  def create
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:message_id])
    @chat = Chat.create(chat_params)
    if @chat.save
      respond_to do |format|
        format.html { redirect_to group_message_chats_path(@chat.group_id,@chat.message_id) }
        format.json
      end
    else
      render :new
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:message_id])
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to group_message_chats_path(@chat.group_id,@chat.message_id)
  end

  private

  def chat_params
    params.require(:chat).permit(:comment).merge(user_id: current_user.id,group_id:@group.id,message_id:@message.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  
end
