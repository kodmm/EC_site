class EndUsers::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new
  end

end
