class Admin::OrderDetailsController < ApplicationController
  def update
    @order = current_customer.orders.find(params[:order_id])
    order_details = @order.order_details.find(params[:id])
    order_details.update(order_detail_params)
    redirect_to request.referer
  end

private
  def order_detail_params
    params.require(:order_detail).permit(:product_status)
  end
end
