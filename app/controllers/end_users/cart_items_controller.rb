class EndUsers::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.end_user_id = current_end_user.id
    cart_item.item_id = Item.find(params[:id])
    cart_item.save
    redirect_to end_users_cart_items_path
  end

  def destroy
    
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:end_user_id, :item_id, :amount)
  end

end