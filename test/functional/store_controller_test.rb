require 'test_helper'

class StoreControllerTest < ActionController::TestCase

  test "store controller is localized" do
    locale = LANGUAGES.to_a.first.last
    @request.session[:user_id] = users(:one).id
    get :index, :locale => locale
 
    translations = YAML.load_file("#{LOCALES_DIRECTORY}#{locale}.yml")
    assert_match translations[locale]['layout']['store']['side']['questions'], @response.body
  end

  test "session contains cart" do 
    get :index
    assert session[:cart]
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)

    Product.find_products_for_sale.each do |product|
      assert_tag :tag => 'h3', :content => product.title
      assert_match /#{sprintf("%01.2f", product.price)}/, @response.body
    end
  end

  test "can add product to cart" do
    post :add_to_cart, :id => products(:one).id
#    assert_response :success
    assert_response :redirect # redirect to index
    assert cart = assigns(:cart)
    assert_equal 1, cart.items.size
  end

  test "cart can handle bad ids" do 
    post :add_to_cart, { :id => Product.maximum(:id) + 1 } 
    assert_response :redirect 
    assert flash[:notice] 
  end

  test "empty cart empties cart" do
    post :empty_cart
    assert_nil session[:cart] 
    assert_response :redirect 
  end

end
