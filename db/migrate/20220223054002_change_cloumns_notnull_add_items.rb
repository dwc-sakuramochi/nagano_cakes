class ChangeCloumnsNotnullAddItems < ActiveRecord::Migration[6.1]
  def change
    change_column_null :items, :item_name, false
    change_column_null :items, :item_explanation, false
    change_column_null :items, :non_taxed_price, false
  end
end
