class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])

  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if order.order_status_before_type_cast == 1
      order.order_details.each do |order_detail|
        order_detail.update(production_status: 1)
      end
    end
    redirect_to admins_order_path(order.id)
  end

  private
    def order_params
      params.require(:order).permit(:order_status)
    end
end
