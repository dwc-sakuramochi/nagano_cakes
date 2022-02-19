class Item < ApplicationRecord
  has_one_attached :item_image


  has_many :order_detail
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  
  def add_tax_price
    (self.non_taxed_price * 1.1).round
  end
end
