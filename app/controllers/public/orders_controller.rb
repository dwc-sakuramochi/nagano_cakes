class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if params[:order][:address_option] == "0"
      @order.shipping_post_code = current_customer.post_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_option] == "1"
      @order.shipping_post_code = ShippingAddress.find(params[:order][:address]).shipping_post_code
      @order.shipping_address = ShippingAddress.find(params[:order][:address]).shipping_address
      @order.shipping_name = ShippingAddress.find(params[:order][:address]).shipping_name
    else
    end
    @orders = current_customer.orders
    @order.postage = 800
    @cart_items = current_customer.cart_items
    @sum = 0
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:shipping_address, :shipping_post_code, :shipping_name, :postage, :billing_amount, :payment_method,
    :order_status)
  end

end