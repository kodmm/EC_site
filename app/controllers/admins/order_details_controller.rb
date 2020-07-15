class Admins::OrderDetailsController < ApplicationController
    before_action :authenticate_admin!

    def update
      
        order_detail = OrderDetail.find(params[:id])
        order_detail.update(production_status: params[:order_detail][:production_status])
        if order_detail.production_status_before_type_cast == 2
            order_detail.order.update(order_status: 2)
        end
        order = Order.find(order_detail.order_id)
        isTrue = false
        order.order_details.each do |order_detail| 
            if order_detail.production_status_before_type_cast == 3
                isTrue = true  
            else 
                isTrue = false
            end
        end
        if isTrue
            order_detail.order.update(order_status: 3)
        end
        redirect_to admins_order_path(order_detail.order_id)
   
    end
       
end
