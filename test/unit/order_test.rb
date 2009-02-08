require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  
  test "validates presence of name" do
    order = Order.new
    assert ! order.valid?
    assert order.errors.on(:name)
  end

  test "validates presence of address" do
    order = Order.new
    assert ! order.valid?
    assert order.errors.on(:address)
  end
  
  test "validates presence of email" do
    order = Order.new
    assert ! order.valid?
    assert order.errors.on(:email)
  end
  
  test "validates format of email" do
    order = Order.new
    order.email = 'yar yar yar'
    assert ! order.valid?
    assert order.errors.on(:email)
  end

  test "accepts valid email" do
    order = Order.new
    order.email = 'valid@email.format'
    assert ! order.errors.on(:email)
  end



  
end
