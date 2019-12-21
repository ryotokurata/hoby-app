class GroupsController < ApplicationController
  def index
    @groups = Group.limit(20).order('created_at DESC')
    @group = Group.first
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    redirect_to root_path
  end

  def show
  end
   
private

  def group_params
    params.require(:group).permit(:name, :image).merge(user_id: current_user.id)
  end
end
