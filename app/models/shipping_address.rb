class ShippingAddress < ApplicationRecord
  belongs_to :customer
  def shipping_address_display
  '〒' + shipping_post_code + ' ' + shipping_address + ' ' + shipping_name
  end
end
