class EndUsers::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  def show
  end

  def edit
    
  end

  def update
    end_user = EndUser.find(current_end_user.id)
    if end_user.update(end_user_params)
      redirect_to mypage_end_user_path
    else
      render action: :edit
    end
  end

  def confirm
  end

  private
  def end_user_params
      params.require(:end_user).permit(:email, :name, :kana_surname, :kana_name,:surname, :postal_code, :street_address, :phone_number)
  end
end
