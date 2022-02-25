class Item < ApplicationRecord
  has_one_attached :item_image


  has_many :order_detail
  belongs_to :genre
  has_many :cart_items, dependent: :destroy

  validates :item_name, presence: true
  validates :item_explanation, presence: true
  validates :non_taxed_price, numericality: {only_integer: true}
  validates :sale_status, inclusion: [true, false]

  def add_tax_price
    (self.non_taxed_price * 1.1).round
  end
end
