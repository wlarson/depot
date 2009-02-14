class Order < ActiveRecord::Base
  has_many :order_items
  validates_presence_of :name, :address, :email, :pay_type

  PAYMENT_TYPES = [ 
    # Displayed stored in db 
    [ "Check", "check" ], 
    [ "Credit card", "cc" ], 
    [ "Purchase order", "po" ] 
  ]

  validates_inclusion_of :pay_type, :in => 
    PAYMENT_TYPES.map {|disp, value| value}

  validates_format_of :email,
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    :message => 'must be valid email address.'

  def add_order_items_from_cart(cart)
    cart.items.each do |item|
      oi = OrderItem.from_cart_item(item)
      order_items << oi
    end
  end

end
