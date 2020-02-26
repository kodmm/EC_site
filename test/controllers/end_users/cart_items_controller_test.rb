require 'test_helper'

class EndUsers::CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_users_cart_items_index_url
    assert_response :success
  end

end
