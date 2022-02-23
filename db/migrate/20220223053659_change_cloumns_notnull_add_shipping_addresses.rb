class ChangeCloumnsNotnullAddShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    change_column_null :shipping_addresses, :shipping_address, false
    change_column_null :shipping_addresses, :shipping_post_code, false
    change_column_null :shipping_addresses, :shipping_name, false
  end
end
