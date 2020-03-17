class EndUsers::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new
    @end_user = current_end_user
  end

  def confirm
    @order = session[:order]
    binding.pry

  end

  def create
    session[:order] = Order.new(orderexam_params)
    session[:order][:end_user_id] = current_end_user.id
    redirect_to input_confirm_path
  end

  private
    def orderexam_params
      params.require(:order).permit(:end_user_id, :payment, :street_address)
    end

end
