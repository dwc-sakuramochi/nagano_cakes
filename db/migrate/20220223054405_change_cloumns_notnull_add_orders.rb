class ChangeCloumnsNotnullAddOrders < ActiveRecord::Migration[6.1]
  def change
    change_column_null :orders, :shipping_post_code, false
    change_column_null :orders, :shipping_address, false
    change_column_null :orders, :shipping_name, false
    change_column_null :orders, :postage, false
    change_column_null :orders, :billing_amount, false
    change_column_null :orders, :payment_method, false
    change_column_null :orders, :order_status, false
  end
end
