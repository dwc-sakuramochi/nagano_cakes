class Admin::OrdersController < ApplicationController
  def show
    @order = current_customer.orders.find(params[:id])
    @order_details = @order.order_details
    @sum = 0
  end
  
  def update
    order = current_customer.orders.find(params[:id])
    order.update(order_params)
    redirect_to request.referer
  end
  
private 
  def order_params
    params.require(:order).permit(:order_status)
  end
end