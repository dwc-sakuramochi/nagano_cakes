class ChangeCloumnsNotnullAddCartItems < ActiveRecord::Migration[6.1]
  def change
    change_column_null :cart_items, :amount, false
  end
end
