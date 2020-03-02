class Admins::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.with_deleted
    

  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    end_user = EndUser.find(params[:id])
    end_user = EndUser.find(@end_user.id)
    if user.update(end_user_params)
      redirect_to admins_items_path
    else
      @end_user = end_user
      render action: :edit
    end
  end
  



  private
  def end_user_params
      params.require(:end_user).permit(:email, :name, :kana_surname, :kana_name,:surname, :postal_code, :street_address, :phone_number)
  end
  
end
