class ChangeCloumnsNotnullAddOrderDetails < ActiveRecord::Migration[6.1]
  def change
    change_column_null :order_details, :price, false
    change_column_null :order_details, :amount, false
    change_column_null :order_details, :product_status, false
  end
end
