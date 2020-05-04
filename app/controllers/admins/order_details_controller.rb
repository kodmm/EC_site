class Admins::OrderDetailsController < ApplicationController
    def update
      
        order_detail = OrderDetail.find(params[:id])
        order_detail.update_attributes(production_status: params[:order_detail][:production_status])
        if order_detail.production_status == "製作中"
            order_detail.order.update_attributes(order_status: order_detail.production_status)
        end
        order = Order.find(order_detail.order_id)
        isTrue = false
        order.order_details.each do |order_detail| 
            if order_detail.production_status == "製作完了"
                isTrue = true  
            else 
                isTrue = false
            end
        end
        if isTrue
            order_detail.order.update_attributes(order_status: "発送済み")
        end
        redirect_to admins_order_path(order_detail.order_id)
   
    end
       
end
