class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])

  end

  def update
    order = Order.find(params[:id])
    binding.pry
    order.update(order_params)
    redirect_to admins_order_path(order.id)
  end

  private
    def order_params
      params.require(:order).permit(:end_user_id, :order_status, :total_price, :payment, :postal_code, :postage, :address, :street_address)
    end
end
