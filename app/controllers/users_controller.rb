class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect to root path
  end
  
  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  def login
  end


private

  def user_params
    params.require(:user).permit(:name, :email,:region)
  end
end
