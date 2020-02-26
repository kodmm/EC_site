class EndUsers::EndUsersController < ApplicationController
  def show
  end

  def edit
    
  end

  def update
    user = EndUser.find(current_end_user.id)
    if user.update(end_user_params)
      redirect_to mypage_end_user_path
    else
      render action: :edit
  end
 

  
  end

  def confirm
  end

  private
  def end_user_params
      params.(:end_user).permit(:email, :name, :kana_surname, :kana_name,:surname, :postal_code, :street_address, :phone_number)
  end
end
