class EndUsers::AddressesController < ApplicationController

  def show
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])

  end

  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      redirect_to address_path(current_end_user.id)
    else
      @address = address
      render :edit
    end
  end

  def create
      address = Address.new(address_params)
      address.end_user_id = current_end_user.id
      if address.save
        redirect_to address_path(current_end_user.id)
      else
        @address = address
        @addresses = Address.all
        render :show
      end

  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to address_path(current_end_user.id)
  end

  private
    def address_params
      params.require(:address).permit(:postal_code, :street_address, :address)
    end

end

