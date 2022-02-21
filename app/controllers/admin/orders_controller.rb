class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:order_id])
    @order_detail = OrderDetail.find(params[:order_detail_id])
  end
end