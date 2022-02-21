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
    if @order.save
      cart_items = current_customer.cart_items.all
      cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item_id
      order_detail.order_id = @order.id
      order_detail.amount = cart_item.amount
      order_detail.price = cart_item.item.add_tax_price.to_s
      order_detail.product_status = 0
      order_detail.save
      current_customer.cart_items.destroy_all
      end
    redirect_to complete_orders_path
    end
  end

  def index
    @orders = current_customer.orders.all
    @order_details = OrderDetails.all
  end

  private

  def order_params
    params.require(:order).permit(:shipping_address, :shipping_post_code, :shipping_name, :postage, :billing_amount, :payment_method,
    :order_status)
  end

end