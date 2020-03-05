class EndUsers::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all
  end

  def top
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @taxi = 1.10
  end
end
