class Admins::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.with_deleted
    

  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
  end
  
end
