class StoreController < ApplicationController

  def index
    @cart = find_cart
    @products = Product.find_products_for_sale
  end

  def add_to_cart 
    begin 
      product = Product.find(params[:id]) 
    rescue ActiveRecord::RecordNotFound 
      logger.error("Attempt to access invalid product #{params[:id]}") 
      redirect_to_index "Invalid product" 
    else 
      @cart = find_cart 
      @cart << product
      redirect_to_index 
    end 
  end 

  def empty_cart 
    session[:cart] = nil 
    redirect_to_index "Your cart is currently empty" 
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