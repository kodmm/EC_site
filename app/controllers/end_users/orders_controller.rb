class EndUsers::OrdersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :cart_item_check, only: [:new, :confirm, :create]
  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @end_user = EndUser.find(current_end_user.id)
    @addresses = current_end_user.addresses.all
  end

  def confirm
    @order = session[:order]
    @postage = 1000
    @total_price = 0
    @prices = 0
    current_end_user.cart_items.each do |cart_item|
      price = 0
      price = cart_item.item.price * cart_item.amount
      @total_price = @total_price + price
    end
    @prices = @prices * 1.10
    @total_price = @total_price * 1.10
    @total_price = @total_price.round
    @Order = Order.new
  end

  def create
    order = Order.new(order_params)
    order.end_user_id = current_end_user.id
    order.save
    
    current_end_user.cart_items.each do |cart_item|
      order_detail = OrderDetail.new(
        item_id: cart_item.item_id,
        order_id: order.id,
        amount: cart_item.amount,
        price: cart_item.item.price
      )
      order_detail.save
    end
    session[:order].clear
    current_end_user.cart_items.destroy_all
    redirect_to complete_path

  end

  def examcreate
    session[:order] = Order.new(orderexam_params)
    session[:order][:end_user_id] = current_end_user.id
    if params[:address_btn] == 1
      session[:order]["postal_code"] = current_end_user.postal_code
      session[:order]["street_address"] = current_end_user.street_address
      session[:order]["address"] = current_end_user.name

    elsif params[:address_btn] == 2
      street_address = current_end_user.addresses.find_by(street_address: params[:address_btn])
      session[:order]["postal_code"] = street_address.postal_code
      session[:order]["address"] = street_address.address
      session[:order]["street_address"] = street_address.street_address
      
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
      params.require(:order).permit(:end_user_id, :payment, :street_address, :postal_code, :address)
    end
    def address_params
      params.require(:order).permit(:end_user_id, :street_address, :postal_code, :address)
    end
    def order_params 
      params.require(:order).permit(:end_user_id, :total_price, :payment, :postal_code, :postage, :address, :street_address)
    end

    def cart_item_check
      cart_item = current_end_user.cart_items
      unless cart_item.exists?
        redirect_to items_path
      end
    end

end
