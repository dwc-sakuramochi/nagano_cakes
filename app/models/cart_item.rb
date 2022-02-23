class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :custom

  def subtotal
    item.add_tax_price * amount
  end
  
end
