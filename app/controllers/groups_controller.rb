class GroupsController < ApplicationController
  def index
    if user_signed_in?
    else
    redirect_to users_path
    end
  end
end
