class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def comfirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_comfirm_path
  end



  private

  def order_params
    params.require(:order).permit(:shippig_address, :shipping_post_code, :shipping_name, :postage, :billing_amount, :payment_method)
  end

end