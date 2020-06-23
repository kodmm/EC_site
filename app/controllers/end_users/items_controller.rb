class EndUsers::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    
    if params[:genre_id].nil?
     @searches = Item.search(params[:name])
   
      @search_result = @searches.name
    else 
      @searches = Item.where(genre_id: params[:genre_id], status: 0)
      @search_result = Genre.find(params[:genre_id]).name
    end
   
    @searches = @searches.select { |data| data.genre.status_before_type_cast == 0 }

  end

  #def genres
   # @genres = Genre.all
   # @searches = Item.where(genre_id: params[:genre_id], status: 0)
   # @searches = @searches.select { |data| data.genre.status_before_type_cast == 0 }
    # render :index
  #end

  def top
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @taxi = 1.10
    @cart_item = CartItem.new
  end
end
