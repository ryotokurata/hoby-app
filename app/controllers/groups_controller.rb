class GroupsController < ApplicationController
  def index
    @groups = Group.all.page(params[:page]).per(10)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end
   
private

  def group_params
    params.require(:group).permit(:name, :image)
  end
end
