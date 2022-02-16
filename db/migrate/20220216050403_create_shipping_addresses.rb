class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      t.integer :customer_id
      t.string :shipping_address
      t.string :shipping_post_code
      t.string :shipping_name
      t.timestamps
    end
  end
end
