class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])

  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if order.order_status = "入金確認"
      order.order_details.each do |order_detail|
        order_detail.update_attributes(production_status: "製作待ち")
      end   
    end
    redirect_to admins_order_path(order.id)
  end

  private
    def order_params
      params.require(:order).permit(:end_user_id, :order_status, :total_price, :payment, :postal_code, :postage, :address, :street_address)
    end
end
