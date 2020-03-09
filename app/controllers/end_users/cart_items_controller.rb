class EndUsers::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all 
    
  end

  def create
    
    cart_item = CartItem.new(cart_item_params)
    cart_item.end_user_id = current_end_user.id
    cart_item.save
    redirect_to cart_items_path
  end

  def update
    cart_item = CartItem.new(cart_item_params)
    
    binding.pry
    cart_item.update
    redirect_to cart_items_path
  end
  
  def destroy
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to  items_path
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:end_user_id, :item_id, :amount)
  end
end
