require 'test_helper'

class CartTest < ActiveSupport::TestCase

  def setup
    @cart = Cart.new
  end

  def test_initialize
    assert_equal 0, @cart.items.size
  end

  def test_add_product
    @cart.add_product products(:one)
    assert_equal 1, @cart.items.size
  end
  
  def test_chevron
    @cart << products(:one)
    assert_equal 1, @cart.items.size
  end

  def test_total_price
    2.times { @cart << products(:one) }
    assert_equal products(:one).price * 2 , @cart.total_price
  end

  def test_total_items
    2.times { @cart << products(:one) }
    assert_equal 2, @cart.total_items
  end

end