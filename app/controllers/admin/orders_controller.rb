class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
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