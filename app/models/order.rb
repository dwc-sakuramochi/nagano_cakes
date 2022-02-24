class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  validates :shipping_post_code, presence: true
  validates :shipping_address, presence: true
  validates :shipping_name, presence: true
  validates :postage, presence: true
  validates :billing_amount, numericality: { greater_than_or_equal_to: 801}
  validates :payment_method, presence: true
  validates :order_status, presence: true
  
  

  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
end
