class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
#  validates_existence_of :order, :product # add these when rails accepts the patch

  validates_presence_of :product_id, :order_id, :quantity, :total_price
  validates_numericality_of :product_id, :order_id, :quantity, :total_price
end
