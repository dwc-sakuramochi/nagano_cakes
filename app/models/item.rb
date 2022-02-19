class Item < ApplicationRecord
  has_one_attached :item_image
  has_many :cart_item
  has_many :order_detail

  def add_tax_price
    (self.non_taxed_price * 1.1).round
  end
end
