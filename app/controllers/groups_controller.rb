class GroupsController < ApplicationController
  def index
    @groups = Group.all
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
    params.require(:group).permit(:name, :image)
  end
end
