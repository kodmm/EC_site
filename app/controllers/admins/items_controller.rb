class Admins::ItemsController < ApplicationController
  def index
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to admins_items_path
    else 
      @item = item
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :genre_id, :price, :image, :status, :details)
  end

end
