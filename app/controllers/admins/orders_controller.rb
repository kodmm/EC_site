class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all 
  end

  def show
    @order = Order.find(params[:id])

  end

  def update
    address = Address.find(params[:id])
    address.update(order_params)
    binding.pry
    redirect_to admins_order_path(address.id)
  end

  private
    def order_params
      params.require(:order).permit(:end_user_id, :order_status, :total_price, :payment, :postal_code, :postage, :address, :street_address)
    end
end
