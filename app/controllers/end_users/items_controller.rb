class EndUsers::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all
  end

  def top
  end

  def show
  end
end
