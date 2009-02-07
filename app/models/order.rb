class Order < ActiveRecord::Base
  has_many :order_items

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :email
  validates_presence_of :pay_type

  validates_format_of :email,
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    :message => 'must be valid email address.'

end
