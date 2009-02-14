class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
#  validates_existence_of :order, :product # add these when rails accepts the patch

  validates_presence_of :product_id, :quantity, :total_price
  validates_numericality_of :product_id, :quantity, :total_price

  def self.from_cart_item cart_item
    oi = self.new
    oi.product = cart_item.product
    oi.quantity = cart_item.quantity
    oi.total_price = cart_item.price
    oi
  end

end
