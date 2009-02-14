class StoreController < ApplicationController

  def index
    @cart = find_cart
    @products = Product.find_products_for_sale
  end

  def add_to_cart
    product = Product.find(params[:id])
    @cart = find_cart
    @current_item = @cart << product
    respond_to do |format|
      format.js if request.xhr?
      format.html { redirect_to_index }
    end
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid product #{params[:id]}")
    redirect_to_index "Invalid product"
  end

  def empty_cart
    session[:cart] = nil
    redirect_to_index
  end
  
  def checkout
    @cart = find_cart
    if @cart.items.empty?
      redirect_to_index("Your cart is empty")
    else
      @order = Order.new
    end
  end
    
  def save_order
    @cart = find_cart
    @order = Order.new(params[:order]) 
    @order.add_order_items_from_cart(@cart) 
    if @order.save                     
      session[:cart] = nil
      redirect_to_index("Thank you for your order")
    else
      render :action => 'checkout'
    end
  end
  
  private
  
  def find_cart
    session[:cart] ||=Cart.new
  end

  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => 'index'
  end

end
