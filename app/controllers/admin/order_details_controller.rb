class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin
  def update
    order = Order.find(params[:order_id])
    order_details = order.order_details.find(params[:id])
    order_details.update(order_detail_params)

    order.update(order_status: "製作中")if order_details.product_status == "製作中"

    order.order_details.each do |order_detail|
      if order_detail.product_status == "製作完了"
        order.update(order_status: "発送準備中")
      end
    end

    order.order_details.each do |order_detail|
      if order_detail.product_status != "製作完了"
        order.update(order_status: "製作中")
      end
    end

    # if order_details.where(product_status: "製作完了").count == order_details.count
    #   order.update(order_status: "発送準備中")
    # end
    
    redirect_to request.referer
  end

private
  def order_detail_params
    params.require(:order_detail).permit(:product_status)
  end
end
