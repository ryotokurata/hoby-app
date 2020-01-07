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

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to group_messages_path(@message.group_id)
  end

  def edit
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:id])
    @message.update(message_params)
    redirect_to group_messages_path(@group.id,@message.id)
  end

  def search
    @group = Group.find(params[:group_id])
    @messages = Message.search(params[:search]).page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.json
    end
  end

private

  def message_params
    params.require(:message).permit(:content,:text,:image,:keyword).merge(user_id: current_user.id,group_id:@group.id)
  end
end
