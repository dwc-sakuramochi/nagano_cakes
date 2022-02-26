class ShippingAddress < ApplicationRecord
  belongs_to :customer
  validates :shipping_address, presence: true
  validates :shipping_post_code, presence: true
  validates :shipping_name, presence: true
  def shipping_address_display
  '〒' + shipping_post_code + ' ' + shipping_address + ' ' + shipping_name
  end
end
