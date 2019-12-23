class MessagesController < ApplicationController
  def index
    @messages = Message.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end

  def show
  end

private

  def message_params
    params.require(:message).permit(:content,:text,:image).merge(user_id: current_user.id)
  end
end
