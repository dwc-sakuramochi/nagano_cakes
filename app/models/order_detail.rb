class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  validates :price, numericality: {only_integer: true}
  validates :amount, numericality: {only_integer: true}
  validates :product_status, presence: true

  enum product_status: { 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3}

  def subtotal
    item.add_tax_price * amount
  end
end
