class Item < ApplicationRecord
  has_one_attached :item_image
  belongs_to :genre
  
  def add_tax_price
    (self.non_taxed_price * 1.1).round
  end
end
