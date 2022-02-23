class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  validates :amount, numericality: {only_integer: true}


  def subtotal
    item.add_tax_price * amount
  end

end
