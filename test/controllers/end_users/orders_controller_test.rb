require 'test_helper'

class EndUsers::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_users_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get end_users_orders_show_url
    assert_response :success
  end

  test "should get new" do
    get end_users_orders_new_url
    assert_response :success
  end

end
