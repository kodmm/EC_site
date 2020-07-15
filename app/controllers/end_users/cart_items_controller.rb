class EndUsers::CartItemsController < ApplicationController
  before_action :authenticate_end_user!
  def index
    @total_price = 0
    current_end_user.cart_items.each do |cart_item|
      price = 0
      price = cart_item.item.price * cart_item.amount
      @total_price = @total_price + price
    end
    @total_price = @total_price * 1.10
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.end_user_id = current_end_user.id

        sum = cart_item.amount.to_i + cart.amount

        cart.update(amount: sum)
        isExist = true
        break
      end
    end
    unless isExist
    if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
     cart_item = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
     cart_item.update(amount: cart_item.amount = cart_item.amount + params[:cart_item][:amount].to_i)
    else
      cart_item.save
    end
    redirect_to cart_items_path
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to  items_path
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
