require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase

  test "from cart item" do
    cart_item = CartItem.new(products(:one))

    order_item = OrderItem.from_cart_item(cart_item)
    
    assert_equal products(:one), order_item.product
    assert_equal 1, order_item.quantity
    assert_equal products(:one).price, order_item.total_price
  end

  test "from cart item with many of same product" do
    cart_item = CartItem.new(products(:one))
    cart_item.increment_quantity
    
    order_item = OrderItem.from_cart_item(cart_item)

    assert_equal products(:one), order_item.product
    assert_equal 2, order_item.quantity
    assert_equal cart_item.price, order_item.total_price
  end

  test "order item has order" do
    order_item = order_items(:one)
    order_item.order = orders(:two)
    order_item.save!
    assert_equal order(:two), order_item.order
  end

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
