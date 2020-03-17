class EndUsers::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new
    @end_user = EndUser.find(current_end_user.id)
  end

  def confirm
    @order = session[:order]
    @total_price = 0
    @prices = 0
    current_end_user.cart_items.each do |cart_item|
      price = 0
      price = cart_item.item.price * cart_item.amount
      @prices = @prices + cart_item.item.price
      @total_price = @total_price + price
    end
    @prices = @prices * 1.10
    @total_price = @total_price * 1.10

  end

  def create
    session[:order] = Order.new(orderexam_params)
    session[:order][:end_user_id] = current_end_user.id
    redirect_to input_confirm_path
  end

  private
    def orderexam_params
      params.require(:order).permit(:end_user_id, :payment, :street_address)
    end

end
