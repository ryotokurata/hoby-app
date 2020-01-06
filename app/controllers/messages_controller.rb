class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @messages = @group.messages.includes(:user).page(params[:page]).per(5)
  end

  def new
    @group = Group.find(params[:group_id])
    @messages = @group.messages.includes(:user)
    @message = Message.new
  end

  def create
    @group = Group.find(params[:group_id])
    @message = Message.create(message_params)
    if @message.save
      redirect_to group_messages_path(@group.id)
    else
      render :new
    end
  end

  def search
    @group = Group.find(params[:group_id])
    @messages = Message.search(params[:search]).page(params[:page]).per(5)
  end

private

  def message_params
    params.require(:message).permit(:content,:text,:image,:keyword).merge(user_id: current_user.id,group_id:@group.id)
  end
end
