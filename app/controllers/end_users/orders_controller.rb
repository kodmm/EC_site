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
    @postage = 1000
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
    @total_price = (@total_price + @postage).round
    @Order = Order.new
  end

  def create
    order = Order.new(order_params)
    order.end_user_id = current_end_user.id
    order.save
    session[:order].clear
    current_end_user.cart_items.destroy_all
    redirect_to complete_path

  end

  def examcreate
    session[:order] = Order.new(orderexam_params)
    session[:order][:end_user_id] = current_end_user.id
    if session[:order]["address_btn"] == 1
      session[:order]["postal_code"] = current_end_user.postal_code
      session[:order]["street_address"] = current_end_user.street_address
      session[:order]["address"] = current_end_user.name

    elsif session[:order]["address_btn"] == 2
      street_address = Address.where(street_address: session[:order]["street_address"])
      session[:order]["postal_code"] = street_address[0].postal_code
      session[:order]["address"] = street_address[0].address
    else   
      address = Address.new(address_params)
      address.end_user_id = current_end_user.id
      address.save
    end
    redirect_to input_confirm_path

  end

  def complete
  end


  private
    def orderexam_params
      params.require(:order).permit(:end_user_id, :address_btn, :payment, :street_address, :postal_code, :address)
    end
    def address_params
      params.require(:order).permit(:end_user_id, :street_address, :postal_code, :address)
    end
    def order_params 
      params.require(:order).permit(:end_user_id, :order_status, :total_price, :payment, :postal_code, :postage, :address, :street_address)
    end

end
