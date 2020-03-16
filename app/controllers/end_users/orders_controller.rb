class EndUsers::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new
  end

  def confirm
    session[:order] = Order.new(orderexam_params)
    session[:order][:end_user_id] = current_end_user.id
    @order = session[:order]

  end

  def create
    session[:order] = Order.new(orderexam_params)
    session[:order][:end_user_id] = current_end_user.id
    redirect_to items_ppat
  end

  private
    def orderexam_params
      params.require(:order).permit(:end_user_id, :payment, :street_address)
    end

end
