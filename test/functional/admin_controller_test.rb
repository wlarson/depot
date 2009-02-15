require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def setup
    @request.session[:user_id] = users(:one).id
  end


end
