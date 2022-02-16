class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :item_name
      t.text :item_explanation
      t.integer :non_taxed_price
      t.boolean :sale_status, null: false, default: true
      t.timestamps
    end
  end
end
