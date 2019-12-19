class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect to root path
  end


private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
