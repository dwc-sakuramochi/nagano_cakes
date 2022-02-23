class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    order = Order.find(params[:id])
    order_details = order.order_details
    order.update(order_params)
    order_details.update_all(product_status: "製作待ち") if order.order_status == "入金確認"
    redirect_to request.referer
  end

private
  def order_params
    params.require(:order).permit(:order_status)
  end
end