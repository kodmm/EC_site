class EndUsers::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @searches = Item.search(params[:name])
  end

  def top
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @taxi = 1.10
    @cart_item = CartItem.new
  end
end
