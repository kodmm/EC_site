class EndUsers::AddressesController < ApplicationController
  def edit
  end
  def show
    @address = Address.new
    @addresses = Address.all
  end

  def create
    
  end

  private
    def address_params
      params.require(:address).permit(:postal_code, :street_address, :address)
    end

end

