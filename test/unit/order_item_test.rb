require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase

  test "validates presence of order_id" do
    order = OrderItem.new
    assert ! order.valid?
    assert order.errors.on(:order_id)
  end

  test "validates presence of product_id" do
    order = OrderItem.new
    assert ! order.valid?
    assert order.errors.on(:product_id)
  end
  
  test "validates presence of quantity" do
    order = OrderItem.new
    assert ! order.valid?
    assert order.errors.on(:quantity)
  end
  
  test "validates presence of total_price" do
    order = OrderItem.new
    assert ! order.valid?
    assert order.errors.on(:total_price)
  end

  test "order_id must be a number" do
    order_item = order_items(:one)
    order_item.order_id = 'hello world!'
    assert ! order_item.valid?
    assert order_item.errors.on(:order_id)
  end

  test "product_id must be a number" do
    order_item = order_items(:one)
    order_item.product_id = 'hello world!'
    assert ! order_item.valid?
    assert order_item.errors.on(:product_id)
  end

  test "quantity must be a number" do
    order_item = order_items(:one)
    order_item.quantity = 'hello world!'
    assert ! order_item.valid?
    assert order_item.errors.on(:quantity)
  end

end
